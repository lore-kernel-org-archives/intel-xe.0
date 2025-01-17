Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E03C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 02:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537D10E160;
	Fri, 17 Jan 2025 02:25:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADB710E106;
 Fri, 17 Jan 2025 02:25:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8382499287024033253=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Check_Scaler_and_DSC_Prefi?=
 =?utf-8?q?ll_Latency_Against_Vblank_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 02:25:32 -0000
Message-ID: <173708073221.484510.13227967960792739686@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116163130.3816719-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250116163130.3816719-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============8382499287024033253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check Scaler and DSC Prefill Latency Against Vblank (rev4)
URL   : https://patchwork.freedesktop.org/series/143159/
State : failure

== Summary ==

CI Bug Log - changes from xe-2498-50d15a728295807727a2642284d639fc71ecaa15_full -> xe-pw-143159v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143159v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143159v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143159v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [PASS][1] -> [DMESG-FAIL][2] +7 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +17 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +37 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [FAIL][7] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][8] -> [FAIL][9] +52 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-lnl:          [PASS][10] -> [SKIP][11] +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] +7 other tests incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_hdr@bpc-switch-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][15] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_hdr@bpc-switch@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-adlp:         [PASS][19] -> [SKIP][20] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] +21 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-8/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-1/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][23] -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][25] ([Intel XE#316]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][27] ([Intel XE#1033]) -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][29] ([Intel XE#1033]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_content_protection@uevent:
    - shard-adlp:         [SKIP][31] ([Intel XE#455]) -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_content_protection@uevent.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][33] ([Intel XE#2316]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-bmg:          [SKIP][35] ([Intel XE#2136]) -> [FAIL][36] +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][37] ([Intel XE#1033] / [Intel XE#324]) -> [FAIL][38] +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [SKIP][39] ([Intel XE#2423]) -> [INCOMPLETE][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html

  
New tests
---------

  New tests have been introduced between xe-2498-50d15a728295807727a2642284d639fc71ecaa15_full and xe-pw-143159v4_full:

### New IGT tests (405) ###

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_atomic@crtc-invalid-params@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [6.30] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [6.30] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [9.01] s

  * igt@kms_atomic_transition@modeset-transition@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [9.02] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [21.93] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [18.46] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [22.17] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [18.48] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.74] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.74] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.55] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.74] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.41] s

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_cursor_edge_walk@128x128-top-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.41] s

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.32] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.32] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.35] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-plain-flip@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.94] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@dpms-off-confusion@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@dpms-off-confusion@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - Statuses : 1 fail(s)
    - Exec time: [1.88] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - Statuses : 1 fail(s)
    - Exec time: [0.50] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - Statuses : 1 fail(s)
    - Exec time: [0.35] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - Statuses : 1 fail(s)
    - Exec time: [3.81] s

  * igt@kms_flip@flip-vs-panning@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@flip-vs-panning@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.98] s

  * igt@kms_flip@flip-vs-panning@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.98] s

  * igt@kms_flip@flip-vs-panning@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [2.94] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.34] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.40] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_invalid_mode@bad-hsync-end@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_invalid_mode@bad-hsync-end@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-revoke@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-revoke@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-revoke@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-revoke@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lessee-list@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lessee-list@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-128:
    - Statuses : 1 fail(s)
    - Exec time: [0.36] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - Statuses : 1 fail(s)
    - Exec time: [0.36] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:
    - Statuses : 1 fail(s)
    - Exec time: [0.48] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.90] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.90] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.94] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [9.05] s

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.67] s

  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.69] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@tiling-x@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-6-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-6-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-6-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-6-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_sequence@get-forked@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_sequence@get-forked@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_sequence@get-forked@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_sequence@get-forked@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-a-hdmi-a-6-pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-b-hdmi-a-6-pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-a-hdmi-a-6-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-b-hdmi-a-6-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_vblank@crtc-id@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_vblank@query-busy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_vblank@query-forked-busy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_vblank@wait-busy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_vblank@wait-busy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  

Known issues
------------

  Here are the changes found in xe-pw-143159v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#1885])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3249])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2134])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@fbdev@nullptr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#873])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#3658])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#316])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1407])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#3225])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1428])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1124]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         [PASS][55] -> [SKIP][56] ([Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2191])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2191])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#787]) +111 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][61] ([Intel XE#3862])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2669]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1727] / [Intel XE#3124])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2887]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#314]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#373]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#1178]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1188])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#308])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [PASS][74] -> [ABORT][75] ([Intel XE#4083])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][76] ([Intel XE#4083])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2291]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6 (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([i915#3804])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#2136]) +8 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#3321])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#301]) +7 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#3321])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2316]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][89] -> [INCOMPLETE][90] ([Intel XE#2597])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#886]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [PASS][93] -> [SKIP][94] ([Intel XE#1745]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397] / [Intel XE#1745])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1397])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#651]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#651]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#653]) +8 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][103] -> [INCOMPLETE][104] ([Intel XE#3966])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1450] / [Intel XE#2568])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1450]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#616])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#361])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - shard-adlp:         [PASS][110] -> [SKIP][111] ([Intel XE#2763] / [Intel XE#455]) +36 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2763]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-adlp:         [PASS][114] -> [SKIP][115] ([Intel XE#2763]) +85 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#2763]) +65 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][118] -> [SKIP][119] ([Intel XE#2763]) +73 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-adlp:         [PASS][120] -> [SKIP][121] ([Intel XE#455]) +26 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#2763]) +44 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#2763] / [Intel XE#455]) +43 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1129])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#2446])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1489]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1406])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3414]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [PASS][134] -> [SKIP][135] ([Intel XE#2423]) +41 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1499])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#756])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1123])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2905]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2905]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-large:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@xe_evict@evict-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1392]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#1392]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_exec_basic@multigpu-once-rebind.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#288]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][146] ([Intel XE#1169])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [PASS][147] -> [DMESG-WARN][148] ([Intel XE#2953]) +7 other tests dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1420] / [Intel XE#2838])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][151] -> [ABORT][152] ([Intel XE#1358] / [Intel XE#1794])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][153] -> [ABORT][154] ([Intel XE#1358] / [Intel XE#1607])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][155] -> [ABORT][156] ([Intel XE#2625]) +1 other test abort
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][157] -> [SKIP][158] ([Intel XE#1130]) +86 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_spin_batch@spin-all.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][159] ([Intel XE#1885]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][161] ([Intel XE#2134]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@fbdev@write.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][163] ([Intel XE#2136]) -> [PASS][164] +8 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][165] ([Intel XE#3862]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [SKIP][167] ([Intel XE#2423]) -> [PASS][168] +25 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][169] ([Intel XE#877]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][171] ([Intel XE#2291]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][175] ([Intel XE#2625]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][177] ([Intel XE#886]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#301]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [INCOMPLETE][181] -> [PASS][182] +3 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][183] ([Intel XE#2446]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][185] ([Intel XE#1435]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][187] ([Intel XE#1522]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_vrr@flipline.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1392]) -> [PASS][190] +3 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#2953]) -> [PASS][192] +3 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4045]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-pagesize.html
    - shard-bmg:          [SKIP][195] ([Intel XE#4045]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][197] ([Intel XE#1358]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [SKIP][199] ([Intel XE#1130]) -> [PASS][200] +90 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_query@query-gt-list.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_query@query-gt-list.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][201] ([Intel XE#2327]) -> [SKIP][202] ([Intel XE#2136])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][203] ([Intel XE#2136]) -> [SKIP][204] ([Intel XE#2327]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][205] ([Intel XE#2136]) -> [SKIP][206] ([Intel XE#1124]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][207] ([Intel XE#1124]) -> [SKIP][208] ([Intel XE#2136]) +5 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][209] ([Intel XE#2423]) -> [SKIP][210] ([Intel XE#367]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][211] ([Intel XE#2423]) -> [SKIP][212] ([Intel XE#2314] / [Intel XE#2894])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][213] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][214] ([Intel XE#2423])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][215] ([Intel XE#367]) -> [SKIP][216] ([Intel XE#2423]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][217] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][218] ([Intel XE#2136]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][219] ([Intel XE#3432]) -> [SKIP][220] ([Intel XE#2136])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][221] ([Intel XE#2136]) -> [SKIP][222] ([Intel XE#3432])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][223] ([Intel XE#2887]) -> [SKIP][224] ([Intel XE#2136]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][225] ([Intel XE#2136]) -> [SKIP][226] ([Intel XE#2887]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][227] ([Intel XE#2252]) -> [SKIP][228] ([Intel XE#2423]) +6 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][229] ([Intel XE#2423]) -> [SKIP][230] ([Intel XE#2252]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][231] ([Intel XE#2423]) -> [SKIP][232] ([Intel XE#2390])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][233] ([Intel XE#2390]) -> [SKIP][234] ([Intel XE#2423])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][235] ([Intel XE#2423]) -> [SKIP][236] ([Intel XE#2320]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][237] ([Intel XE#2321]) -> [SKIP][238] ([Intel XE#2423])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][239] ([Intel XE#2320]) -> [SKIP][240] ([Intel XE#2423])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][241] ([Intel XE#2423]) -> [SKIP][242] ([Intel XE#2321])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][243] ([Intel XE#2423]) -> [SKIP][244] ([Intel XE#2291]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][245] ([Intel XE#2291]) -> [SKIP][246] ([Intel XE#2423])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][247] ([Intel XE#2244]) -> [SKIP][248] ([Intel XE#2136])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#2244])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][251] ([Intel XE#776]) -> [SKIP][252] ([Intel XE#2136])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_fbcon_fbt@psr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][253] ([Intel XE#2316]) -> [SKIP][254] ([Intel XE#2423]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][255] ([Intel XE#2423]) -> [SKIP][256] ([Intel XE#2316]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][258] ([i915#2575]) +26 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_flip@busy-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][259] ([Intel XE#2380]) -> [SKIP][260] ([Intel XE#2136])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][261] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][262] ([Intel XE#2136]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][263] ([Intel XE#2136]) -> [SKIP][264] ([Intel XE#2293] / [Intel XE#2380])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#2311]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [SKIP][268] ([Intel XE#2311]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2312]) -> [SKIP][270] ([Intel XE#2136]) +12 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][271] ([Intel XE#2311]) -> [SKIP][272] ([Intel XE#2312]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][273] ([Intel XE#2333]) -> [SKIP][274] ([Intel XE#2136]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][275] ([Intel XE#2136]) -> [FAIL][276] ([Intel XE#2333]) +5 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [FAIL][278] ([Intel XE#2333])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][279] ([Intel XE#2333]) -> [SKIP][280] ([Intel XE#2312]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#2352])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][283] ([Intel XE#2311]) -> [SKIP][284] ([Intel XE#2136]) +10 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][286] ([Intel XE#2136] / [Intel XE#2231]) +9 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][287] ([Intel XE#2136]) -> [SKIP][288] ([Intel XE#2313]) +11 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][289] ([Intel XE#2313]) -> [SKIP][290] ([Intel XE#2312]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#2312]) +10 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][293] ([Intel XE#2312]) -> [SKIP][294] ([Intel XE#2313]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-bmg:          [SKIP][295] ([Intel XE#2313]) -> [SKIP][296] ([Intel XE#2136]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#346])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][299] ([Intel XE#346]) -> [SKIP][300] ([Intel XE#2136])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-bmg:          [SKIP][301] ([Intel XE#2423]) -> [SKIP][302] ([Intel XE#2763]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-bmg:          [SKIP][303] ([Intel XE#2763]) -> [SKIP][304] ([Intel XE#2423])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#870]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][307] ([Intel XE#2136]) -> [FAIL][308] ([Intel XE#1430])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][309] ([Intel XE#2499]) -> [SKIP][310] ([Intel XE#2136])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][311] ([Intel XE#1489]) -> [SKIP][312] ([Intel XE#2136]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][313] ([Intel XE#2136]) -> [SKIP][314] ([Intel XE#1489]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2231]) +28 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][319] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][320] ([Intel XE#2136]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_psr@pr-sprite-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][321] ([Intel XE#2423]) -> [SKIP][322] ([Intel XE#3414] / [Intel XE#3904])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#2413])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][325] ([Intel XE#1435]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][327] ([Intel XE#1729]) -> [SKIP][328] ([Intel XE#362])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1500]) -> [SKIP][330] ([Intel XE#362])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#1499])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_vrr@flipline.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][333] ([Intel XE#756]) -> [SKIP][334] ([Intel XE#2423])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][335] ([Intel XE#2905]) -> [SKIP][336] ([Intel XE#1130]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@exec-queue-placements:
    - shard-bmg:          [SKIP][337] ([Intel XE#1130]) -> [SKIP][338] ([Intel XE#2905]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_eudebug@exec-queue-placements.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_eudebug@exec-queue-placements.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][339] ([Intel XE#2322]) -> [SKIP][340] ([Intel XE#1130]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#2322]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][343] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][344] ([Intel XE#1130])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_media_fill@media-fill.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][345] ([Intel XE#1130]) -> [SKIP][346] ([Intel XE#2284])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_pm@d3cold-basic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][347] ([Intel XE#2284]) -> [SKIP][348] ([Intel XE#1130]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_pm@d3cold-mocs.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][349] ([Intel XE#1130]) -> [SKIP][350] ([Intel XE#944])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][351] ([Intel XE#944]) -> [SKIP][352] ([Intel XE#1130])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4083]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2498-50d15a728295807727a2642284d639fc71ecaa15 -> xe-pw-143159v4

  IGT_8195: 8195
  xe-2498-50d15a728295807727a2642284d639fc71ecaa15: 50d15a728295807727a2642284d639fc71ecaa15
  xe-pw-143159v4: 143159v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/index.html

--===============8382499287024033253==
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
<tr><td><b>Series:</b></td><td>Check Scaler and DSC Prefill Latency Against Vblank (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143159/">https://patchwork.freedesktop.org/series/143159/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2498-50d15a728295807727a2642284d639fc71ecaa15_full -&gt; xe-pw-143159v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143159v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143159v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143159v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">DMESG-FAIL</a> +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +52 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_hdr@bpc-switch@pipe-a-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-8/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-1/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_content_protection@uevent.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2498-50d15a728295807727a2642284d639fc71ecaa15_full and xe-pw-143159v4_full:</p>
<h3>New IGT tests (405)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [21.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [22.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.74] s</li>
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
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
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
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
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
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
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
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-4-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-linear-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-6-x-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-linear-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-x-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-linear-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-x-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-x-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-128:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-6-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-6-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-6-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-6-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-6-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-6-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-a-hdmi-a-6-pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-b-hdmi-a-6-pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc@pipe-a-hdmi-a-6-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc@pipe-b-hdmi-a-6-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
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
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143159v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083">Intel XE#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083">Intel XE#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6 (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966">Intel XE#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +86 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-lnl-3/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_query@query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_query@query-gt-list.html">PASS</a> +90 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@exec-queue-placements:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_eudebug@exec-queue-placements.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_eudebug@exec-queue-placements.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2498-50d15a728295807727a2642284d639fc71ecaa15 -&gt; xe-pw-143159v4</li>
</ul>
<p>IGT_8195: 8195<br />
  xe-2498-50d15a728295807727a2642284d639fc71ecaa15: 50d15a728295807727a2642284d639fc71ecaa15<br />
  xe-pw-143159v4: 143159v4</p>

</body>
</html>

--===============8382499287024033253==--
