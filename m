Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60078E77199
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 11:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27D310E4B8;
	Tue,  7 Jan 2025 11:57:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933810E307;
 Tue,  7 Jan 2025 11:57:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6341196270601398399=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Check_Scaler_and_DSC_Prefi?=
 =?utf-8?q?ll_Latency_Against_Vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 11:57:22 -0000
Message-ID: <173625104234.786743.16048183782356887673@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106165111.1672722-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250106165111.1672722-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============6341196270601398399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check Scaler and DSC Prefill Latency Against Vblank
URL   : https://patchwork.freedesktop.org/series/143159/
State : failure

== Summary ==

CI Bug Log - changes from xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a_full -> xe-pw-143159v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143159v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143159v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143159v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_color@ctm-signed@pipe-c-edp-1:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +30 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-4/igt@kms_color@ctm-signed@pipe-c-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_color@ctm-signed@pipe-c-edp-1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +20 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][7] -> [FAIL][8] +33 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
    - shard-bmg:          [PASS][9] -> [FAIL][10] +33 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-lnl:          [PASS][13] -> [SKIP][14] +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][15] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] +14 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_hdr@static-swap.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][18] +4 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] +39 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] +26 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - shard-adlp:         [PASS][25] -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] +13 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-3/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][29] ([Intel XE#2136] / [Intel XE#2351]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#2136]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [SKIP][33] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [SKIP][35] ([Intel XE#2423] / [i915#2575]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  
Known issues
------------

  Here are the changes found in xe-pw-143159v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3768])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#3908]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1407]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#316])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1124]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][49] ([Intel XE#3862])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#2907])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#2705])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#787]) +27 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2887]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#373]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#306])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#306])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#373])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@degamma:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#2423] / [i915#2575]) +26 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_color@degamma.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_color@degamma.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1178])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#3278])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#309]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][67] -> [DMESG-WARN][68] ([Intel XE#877]) +1 other test dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#301]) +3 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#3288] / [Intel XE#3321]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2597])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1421]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#310]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#2882])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#3321])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][84] -> [INCOMPLETE][85] ([Intel XE#2049] / [Intel XE#2597])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][86] -> [INCOMPLETE][87] ([Intel XE#2049])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1745])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [PASS][89] -> [SKIP][90] ([Intel XE#1745]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1397] / [Intel XE#1745])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1397])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#651])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2136]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2136]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#656]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1158])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#653])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#656]) +12 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2934])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2927])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#599]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#361])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2763]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2763]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2763] / [Intel XE#455])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
    - shard-adlp:         [PASS][113] -> [SKIP][114] ([Intel XE#2763]) +33 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-lnl:          [PASS][115] -> [DMESG-WARN][116] ([Intel XE#2566]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][117] -> [SKIP][118] ([Intel XE#2763]) +48 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#2763]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-adlp:         [PASS][121] -> [SKIP][122] ([Intel XE#2763] / [Intel XE#455]) +9 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#2763]) +24 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2-set2:     [PASS][125] -> [DMESG-WARN][126] ([Intel XE#2566]) +2 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - shard-bmg:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#2566]) +2 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][129] ([Intel XE#2566])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#1430])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#2446]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2893])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1489])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1406])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_psr@pr-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][137] ([Intel XE#1874])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#3414] / [Intel XE#3904])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#3414])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1435])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][141] -> [FAIL][142] ([Intel XE#899])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][143] -> [DMESG-WARN][144] ([Intel XE#2953]) +2 other tests dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#756])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1091] / [Intel XE#2849])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#455]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2905]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2905])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#688]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1392])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1392]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#288])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_fault_mode@many-basic-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#2360])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][155] -> [SKIP][156] ([Intel XE#1130]) +61 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [PASS][157] -> [FAIL][158] ([Intel XE#3982])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2541] / [Intel XE#3573])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#2248])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#584])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#579])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][163] -> [FAIL][164] ([Intel XE#958])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [PASS][165] -> [FAIL][166] ([Intel XE#958])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_query@multigpu-query-topology.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1130]) +16 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_vm@invalid-extensions.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2423] / [i915#2575]) -> [PASS][170] +14 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][171] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][173] ([Intel XE#3746]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][175] ([Intel XE#3862]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#2953]) -> [PASS][178] +5 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][179] ([Intel XE#877]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][181] ([Intel XE#3879]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [FAIL][183] ([Intel XE#2882]) -> [PASS][184] +3 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#301]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][187] ([Intel XE#886]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][191] -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][193] ([Intel XE#361]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2136]) -> [PASS][196] +4 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_pm_dc@dc5-dpms.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][197] ([Intel XE#2883]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2423]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@testdisplay.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@testdisplay.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][201] ([Intel XE#3876]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][203] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][205] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][207] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_vm@large-userptr-misaligned-binds-2097152:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1130]) -> [PASS][210] +36 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-2097152.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_vm@large-userptr-misaligned-binds-2097152.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][211] ([Intel XE#3084]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1124]) -> [SKIP][214] ([Intel XE#2136]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2136]) -> [SKIP][216] ([Intel XE#1124]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1124]) -> [SKIP][218] ([Intel XE#2136] / [Intel XE#2351])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][220] ([Intel XE#1124]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#607]) -> [SKIP][222] ([Intel XE#2136])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#367]) -> [SKIP][224] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [SKIP][226] ([Intel XE#367])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][228] ([Intel XE#2136] / [Intel XE#2351])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][230] ([Intel XE#2136]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2136]) -> [SKIP][232] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2423] / [i915#2575]) -> [SKIP][234] ([Intel XE#306])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#306]) -> [SKIP][236] ([Intel XE#2423] / [i915#2575])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#373]) -> [SKIP][238] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2423] / [i915#2575]) -> [SKIP][240] ([Intel XE#373]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423] / [i915#2575]) -> [FAIL][242] ([Intel XE#1178])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [SKIP][244] ([Intel XE#455]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_content_protection@mei-interface.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#308]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#323]) -> [SKIP][248] ([Intel XE#2423] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [SKIP][250] ([Intel XE#323])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#455])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#703]) -> [SKIP][254] ([Intel XE#2423] / [i915#2575])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [FAIL][256] ([Intel XE#301])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [FAIL][257] ([Intel XE#3879]) -> [INCOMPLETE][258] ([Intel XE#2597])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][259] ([Intel XE#3664]) -> [INCOMPLETE][260] ([Intel XE#2597])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#455]) -> [SKIP][262] ([Intel XE#2136]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#651]) -> [SKIP][264] ([Intel XE#2136]) +7 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#651]) -> [SKIP][266] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#658]) -> [SKIP][268] ([Intel XE#2136] / [Intel XE#2351])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][270] ([Intel XE#651]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#651]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][274] ([Intel XE#653]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#653]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#653]) -> [SKIP][278] ([Intel XE#2136]) +8 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136]) -> [SKIP][280] ([Intel XE#653]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#605]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_histogram@algo-color:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#3897]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_histogram@algo-color.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_histogram@algo-color.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [INCOMPLETE][285] ([Intel XE#3663]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#2763] / [Intel XE#455])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][292] ([Intel XE#2566])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#870]) -> [SKIP][294] ([Intel XE#2136])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#908]) -> [SKIP][296] ([Intel XE#2136])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#1489]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1489]) -> [SKIP][300] ([Intel XE#2136]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1122]) -> [SKIP][302] ([Intel XE#2136])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#2850] / [Intel XE#929])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr@pr-primary-page-flip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2351]) -> [SKIP][310] ([Intel XE#2850] / [Intel XE#929])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][312] ([Intel XE#2136]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr@psr2-primary-render.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1127]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2423] / [i915#2575]) -> [SKIP][316] ([Intel XE#330])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_vrr@flipline.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1123]) -> [SKIP][320] ([Intel XE#1130])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1130]) -> [SKIP][322] ([Intel XE#1123])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1130]) -> [SKIP][324] ([Intel XE#1126])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2905]) -> [SKIP][326] ([Intel XE#1130]) +5 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [FAIL][327] ([Intel XE#1000]) -> [INCOMPLETE][328] ([Intel XE#1473])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1130]) -> [SKIP][330] ([Intel XE#288]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#288]) -> [SKIP][332] ([Intel XE#1130]) +11 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1130]) -> [SKIP][334] ([Intel XE#2905]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][336] ([Intel XE#1130]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1130]) -> [SKIP][338] ([Intel XE#2541] / [Intel XE#3573])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_oa@short-reads.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_oa@short-reads.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1130]) -> [SKIP][340] ([Intel XE#2284] / [Intel XE#366])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#944])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#944]) -> [SKIP][344] ([Intel XE#1130])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-size.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879
  [Intel XE#3897]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3982]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3982
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a -> xe-pw-143159v1

  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a: 1c0bba8188ab903248bafdfd0ae42d8e43adaf4a
  xe-pw-143159v1: 143159v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/index.html

--===============6341196270601398399==
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
<tr><td><b>Series:</b></td><td>Check Scaler and DSC Prefill Latency Against Vblank</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143159/">https://patchwork.freedesktop.org/series/143159/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a_full -&gt; xe-pw-143159v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143159v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143159v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143159v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-4/igt@kms_color@ctm-signed@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_color@ctm-signed@pipe-c-edp-1.html">DMESG-WARN</a> +30 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +33 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +33 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-default-mode.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_hdr@static-swap.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">DMESG-WARN</a> +39 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">DMESG-WARN</a> +26 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-3/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143159v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +2 other tests dmesg-warn</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_fault_mode@many-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3982">Intel XE#3982</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_vm@invalid-extensions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#3746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879">Intel XE#3879</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_pm_dc@dc5-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879">Intel XE#3879</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664">Intel XE#3664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_histogram@algo-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897">Intel XE#3897</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_histogram@algo-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a -&gt; xe-pw-143159v1</li>
</ul>
<p>IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a: 1c0bba8188ab903248bafdfd0ae42d8e43adaf4a<br />
  xe-pw-143159v1: 143159v1</p>

</body>
</html>

--===============6341196270601398399==--
