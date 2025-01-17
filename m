Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175AAC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 05:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D080110E2EE;
	Fri, 17 Jan 2025 05:00:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DB410EA48;
 Fri, 17 Jan 2025 05:00:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3710103265003044176=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/ptl=3A_Update_GuC_v?=
 =?utf-8?q?ersion_for_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 05:00:05 -0000
Message-ID: <173709000547.576735.11899223203051817791@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
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

--===============3710103265003044176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Update GuC version for PTL
URL   : https://patchwork.freedesktop.org/series/143630/
State : failure

== Summary ==

CI Bug Log - changes from xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full -> xe-pw-143630v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143630v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143630v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143630v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html

  
New tests
---------

  New tests have been introduced between xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full and xe-pw-143630v1_full:

### New IGT tests (45) ###

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.60] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.94] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [9.00] s

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.68] s

  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.66] s

  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.64] s

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [9.01] s

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.64] s

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.74] s

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.67] s

  * igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  

Known issues
------------

  Here are the changes found in xe-pw-143630v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#1885])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3249])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#3453])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#827]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2136]) +18 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#1033])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +83 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#373]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#877])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#2141]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#1340])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#3070])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#703])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#3321])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#301]) +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2293]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#651]) +13 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#656]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#2333])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#653]) +16 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2953]) +6 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-9/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-4/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2763]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2763]) +15 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2446]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2423]) +86 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1489]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#3414])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#899])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][64] -> [ABORT][65] ([Intel XE#2625] / [Intel XE#4057])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][66] ([Intel XE#4057])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2168])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1126]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2905]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#1392]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#288]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2229]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1192]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#3546])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][80] -> [ABORT][81] ([Intel XE#1358])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][82] -> [ABORT][83] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#944])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1130]) +216 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][87] -> [ABORT][88] ([Intel XE#3084])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html
    - shard-adlp:         [PASS][89] -> [ABORT][90] ([Intel XE#3084])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-3/igt@xe_wedged@wedged-mode-toggle.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][91] ([Intel XE#1885]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][93] ([Intel XE#3249]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][95] ([Intel XE#2134]) -> [PASS][96] +2 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@fbdev@nullptr.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@fbdev@nullptr.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][97] ([Intel XE#3908]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][99] ([Intel XE#2136]) -> [PASS][100] +26 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#1033]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][103] ([Intel XE#4083]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][105] ([Intel XE#877]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][107] ([Intel XE#3321]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][109] ([Intel XE#886]) -> [PASS][110] +5 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][111] ([Intel XE#301]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#616]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     [FAIL][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][117] ([Intel XE#2446]) -> [PASS][118] +2 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@cursor.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][119] ([Intel XE#2423]) -> [PASS][120] +90 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][121] ([Intel XE#1522]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@kms_vrr@flipline.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1392]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][125] ([Intel XE#1358]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [ABORT][127] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s3-mocs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][129] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][131] ([Intel XE#1130]) -> [PASS][132] +223 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_spin_batch@spin-all.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][133] ([Intel XE#2233]) -> [SKIP][134] ([Intel XE#2423])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][135] ([Intel XE#2385]) -> [SKIP][136] ([Intel XE#2423])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][137] ([Intel XE#2370]) -> [SKIP][138] ([Intel XE#2423])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][139] ([Intel XE#2327]) -> [SKIP][140] ([Intel XE#2136]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][141] ([Intel XE#2136]) -> [SKIP][142] ([Intel XE#2327])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][143] ([Intel XE#2328]) -> [SKIP][144] ([Intel XE#2136])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][145] ([Intel XE#2136]) -> [SKIP][146] ([Intel XE#1124]) +13 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][147] ([Intel XE#1124]) -> [SKIP][148] ([Intel XE#2136]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][149] ([Intel XE#2423]) -> [SKIP][150] ([Intel XE#2314] / [Intel XE#2894])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][151] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][152] ([Intel XE#2423]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][153] ([Intel XE#2423]) -> [SKIP][154] ([Intel XE#367]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][155] ([Intel XE#367]) -> [SKIP][156] ([Intel XE#2423]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][157] ([Intel XE#2136]) -> [SKIP][158] ([Intel XE#2887]) +17 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][159] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][160] ([Intel XE#2136])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][161] ([Intel XE#2136]) -> [SKIP][162] ([Intel XE#2652] / [Intel XE#787])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][163] ([Intel XE#2136]) -> [SKIP][164] ([Intel XE#3432]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][165] ([Intel XE#3432]) -> [SKIP][166] ([Intel XE#2136])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][167] ([Intel XE#2887]) -> [SKIP][168] ([Intel XE#2136]) +18 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][169] ([Intel XE#2423]) -> [SKIP][170] ([Intel XE#2325]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][171] ([Intel XE#2325]) -> [SKIP][172] ([Intel XE#2423]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][173] ([Intel XE#2252]) -> [SKIP][174] ([Intel XE#2423]) +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][175] ([Intel XE#2423]) -> [SKIP][176] ([Intel XE#2252]) +12 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][177] ([Intel XE#2423]) -> [SKIP][178] ([Intel XE#2341]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][179] ([Intel XE#2423]) -> [SKIP][180] ([Intel XE#2390]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][181] ([Intel XE#2390]) -> [SKIP][182] ([Intel XE#2423])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][183] ([Intel XE#1178]) -> [SKIP][184] ([Intel XE#2423])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][185] ([Intel XE#2341]) -> [SKIP][186] ([Intel XE#2423]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@lic-type-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][187] ([Intel XE#2423]) -> [SKIP][188] ([Intel XE#2320]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][189] ([Intel XE#2320]) -> [SKIP][190] ([Intel XE#2423]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][191] ([Intel XE#2423]) -> [SKIP][192] ([Intel XE#2321]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][193] ([Intel XE#2321]) -> [SKIP][194] ([Intel XE#2423])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][195] ([Intel XE#2286]) -> [SKIP][196] ([Intel XE#2423]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][197] ([Intel XE#2423]) -> [SKIP][198] ([Intel XE#2286])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][199] ([Intel XE#2291]) -> [SKIP][200] ([Intel XE#2423]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][201] ([Intel XE#2423]) -> [SKIP][202] ([Intel XE#2291])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][203] ([Intel XE#2136]) -> [FAIL][204] ([Intel XE#2141])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][205] ([Intel XE#3009]) -> [SKIP][206] ([Intel XE#2423])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_dp_aux_dev.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][207] ([Intel XE#2244]) -> [SKIP][208] ([Intel XE#2136])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_dsc@dsc-basic.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][209] ([Intel XE#2136]) -> [SKIP][210] ([Intel XE#2244]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][211] ([Intel XE#2136]) -> [SKIP][212] ([Intel XE#776])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][213] ([Intel XE#2423]) -> [SKIP][214] ([Intel XE#2375])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][215] ([Intel XE#2423]) -> [SKIP][216] ([Intel XE#3007]) +26 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][217] -> [SKIP][218] ([Intel XE#2423])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][219] ([Intel XE#2423]) -> [SKIP][220] ([Intel XE#2316]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][221] ([Intel XE#2316]) -> [SKIP][222] ([Intel XE#2423]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][223] ([Intel XE#2882]) -> [SKIP][224] ([Intel XE#2423])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][225] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][226] ([Intel XE#2136]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][227] ([Intel XE#2136]) -> [SKIP][228] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][229] ([Intel XE#2311]) -> [SKIP][230] ([Intel XE#2136]) +24 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][231] ([Intel XE#2311]) -> [SKIP][232] ([Intel XE#2312]) +6 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][233] ([Intel XE#2136]) -> [SKIP][234] ([Intel XE#2312]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][235] ([Intel XE#2333]) -> [SKIP][236] ([Intel XE#2136]) +15 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][237] ([Intel XE#2333]) -> [SKIP][238] ([Intel XE#2312]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2136]) -> [FAIL][240] ([Intel XE#2333]) +17 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#2352])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][243] ([Intel XE#2136]) -> [SKIP][244] ([Intel XE#2311]) +32 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][245] ([Intel XE#2136]) -> [SKIP][246] ([Intel XE#2313]) +31 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#2312]) -> [SKIP][248] ([Intel XE#2136]) +27 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][249] ([Intel XE#2313]) -> [SKIP][250] ([Intel XE#2312]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][251] ([Intel XE#2313]) -> [SKIP][252] ([Intel XE#2136]) +24 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][253] ([Intel XE#2423]) -> [SKIP][254] ([Intel XE#2502])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][255] ([Intel XE#2423]) -> [SKIP][256] ([Intel XE#2340])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#346])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][259] ([Intel XE#2934]) -> [SKIP][260] ([Intel XE#2136])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#2934])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][263] ([Intel XE#2423]) -> [SKIP][264] ([Intel XE#2393])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][265] ([Intel XE#2423]) -> [SKIP][266] ([Intel XE#2763]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-bmg:          [SKIP][267] ([Intel XE#2763]) -> [SKIP][268] ([Intel XE#2423])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][269] ([Intel XE#2136]) -> [SKIP][270] ([Intel XE#870]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][271] ([Intel XE#870]) -> [SKIP][272] ([Intel XE#2136])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][273] ([Intel XE#2391]) -> [SKIP][274] ([Intel XE#2136])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][275] ([Intel XE#3309]) -> [SKIP][276] ([Intel XE#2136])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][277] ([Intel XE#2136]) -> [FAIL][278] ([Intel XE#1430])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][279] ([Intel XE#2392]) -> [SKIP][280] ([Intel XE#2136])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#2499])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][283] ([Intel XE#2446]) -> [SKIP][284] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][285] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][286] ([Intel XE#2446])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][287] ([Intel XE#1489]) -> [SKIP][288] ([Intel XE#2136]) +10 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2136] / [Intel XE#2231]) +38 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#1489]) +9 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][293] ([Intel XE#2387]) -> [SKIP][294] ([Intel XE#2136])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][298] ([Intel XE#2136]) +15 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][299] ([Intel XE#2414]) -> [SKIP][300] ([Intel XE#2136])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][301] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][302] ([Intel XE#2423]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][303] ([Intel XE#2423]) -> [SKIP][304] ([Intel XE#3414] / [Intel XE#3904])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][305] ([Intel XE#2413]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][307] ([Intel XE#2423]) -> [SKIP][308] ([Intel XE#2413])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][309] ([Intel XE#2423]) -> [SKIP][310] ([Intel XE#2426])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][311] ([Intel XE#2426]) -> [SKIP][312] ([Intel XE#2423])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][313] ([Intel XE#2423]) -> [SKIP][314] ([Intel XE#2450])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][315] ([Intel XE#1499]) -> [SKIP][316] ([Intel XE#2423]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_vrr@max-min.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][317] ([Intel XE#756]) -> [SKIP][318] ([Intel XE#2423])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][319] ([Intel XE#2423]) -> [SKIP][320] ([Intel XE#756]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][321] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][322] ([Intel XE#2423])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][323] ([Intel XE#3889]) -> [SKIP][324] ([Intel XE#1130]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][325] ([Intel XE#2905]) -> [SKIP][326] ([Intel XE#1130]) +12 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_eudebug_online@single-step.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][327] ([Intel XE#1130]) -> [SKIP][328] ([Intel XE#2905]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][329] ([Intel XE#1130]) -> [SKIP][330] ([Intel XE#2322]) +9 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][331] ([Intel XE#2322]) -> [SKIP][332] ([Intel XE#1130]) +9 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][333] ([Intel XE#1192]) -> [SKIP][334] ([Intel XE#2229])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][335] ([Intel XE#1130]) -> [SKIP][336] ([Intel XE#2459] / [Intel XE#2596])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][337] ([Intel XE#1130]) -> [SKIP][338] ([Intel XE#586])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_mmap@small-bar.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][339] ([Intel XE#1173]) -> [SKIP][340] ([Intel XE#1061])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@xe_peer2peer@write.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][341] ([Intel XE#2284]) -> [SKIP][342] ([Intel XE#1130])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_pm@d3cold-basic.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][343] ([Intel XE#1130]) -> [SKIP][344] ([Intel XE#2284]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][345] ([Intel XE#579]) -> [SKIP][346] ([Intel XE#1130])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#944]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_query@multigpu-query-config.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][349] ([Intel XE#944]) -> [SKIP][350] ([Intel XE#1130]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#3342])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4083]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde -> xe-pw-143630v1

  IGT_8195: 8195
  xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde: 94cf137e747640246cf996a17ca3cebdbd7cbdde
  xe-pw-143630v1: 143630v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/index.html

--===============3710103265003044176==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Update GuC version for PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143630/">https://patchwork.freedesktop.org/series/143630/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full -&gt; xe-pw-143630v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143630v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143630v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143630v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full and xe-pw-143630v1_full:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
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
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
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
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
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
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.60] s</li>
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
<li>Exec time: [5.61] s</li>
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
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
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
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
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
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143630v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-9/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-4/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +216 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@fbdev@nullptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083">Intel XE#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_pm_rpm@cursor.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html">PASS</a> +90 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-464/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_spin_batch@spin-all.html">PASS</a> +223 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143630v1/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde -&gt; xe-pw-143630v1</li>
</ul>
<p>IGT_8195: 8195<br />
  xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde: 94cf137e747640246cf996a17ca3cebdbd7cbdde<br />
  xe-pw-143630v1: 143630v1</p>

</body>
</html>

--===============3710103265003044176==--
