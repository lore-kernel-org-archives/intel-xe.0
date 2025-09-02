Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDB7CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 10:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FF210E658;
	Tue,  2 Sep 2025 10:38:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C29810E658;
 Tue,  2 Sep 2025 10:38:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1883401124226802053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_User_readable_error_codes_?=
 =?utf-8?q?on_atomic=5Fioctl_failure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Sep 2025 10:38:22 -0000
Message-ID: <175680950237.292948.16283834171949961194@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
In-Reply-To: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
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

--===============1883401124226802053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: User readable error codes on atomic_ioctl failure (rev3)
URL   : https://patchwork.freedesktop.org/series/152277/
State : failure

== Summary ==

CI Bug Log - changes from xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30_FULL -> xe-pw-152277v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152277v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152277v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152277v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@atomic-invalid-params:
    - shard-lnl:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_atomic@atomic-invalid-params.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-3/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_atomic@atomic-invalid-params@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-5/igt@kms_atomic@atomic-invalid-params@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-8/igt@kms_atomic@atomic-invalid-params@pipe-a-dp-2.html

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-4/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-3/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10] +58 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] +27 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-d-hdmi-a-2.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][12] -> [ABORT][13] +30 other tests abort
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [ABORT][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][15] +3 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] +265 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][18] +40 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][19] -> [DMESG-WARN][20] +806 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-4/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][21] +41 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-3.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] +800 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [PASS][24] -> [ABORT][25] +18 other tests abort
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-2/igt@kms_vblank@wait-busy-hang.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [FAIL][26] ([Intel XE#4683]) -> [DMESG-FAIL][27] +3 other tests dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          [FAIL][28] ([Intel XE#3106] / [Intel XE#4683]) -> [DMESG-FAIL][29] +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][30] ([Intel XE#5390]) -> [ABORT][31] +4 other tests abort
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          [FAIL][32] ([Intel XE#5195]) -> [DMESG-FAIL][33] +2 other tests dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         [FAIL][34] ([Intel XE#5195]) -> [DMESG-FAIL][35] +4 other tests dmesg-fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][36] ([Intel XE#616]) -> [DMESG-FAIL][37] +1 other test dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][38] ([Intel XE#2029]) -> [DMESG-FAIL][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][40] ([Intel XE#1435]) -> [ABORT][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg2-set2:     [SKIP][42] ([Intel XE#455]) -> [ABORT][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@kms_setmode@basic-clone-single-crtc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-hang}:
    - shard-bmg:          [PASS][44] -> [DMESG-WARN][45] +5 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_async_flips@async-flip-hang.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_async_flips@async-flip-hang.html

  * {igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565}:
    - shard-lnl:          [PASS][46] -> [DMESG-WARN][47] +48 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html

  * {igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-1-linear-xrgb16161616f}:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] +40 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-9/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-1-linear-xrgb16161616f.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-3/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-1-linear-xrgb16161616f.html

  * {igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-x-xyuv8888}:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][50] +35 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-x-xyuv8888.html

  
New tests
---------

  New tests have been introduced between xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30_FULL and xe-pw-152277v3_FULL:

### New IGT tests (1) ###

  * igt@kms_hdmi_inject:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-152277v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#610])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#316])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#4543])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#4543])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2314] / [Intel XE#2894])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#367])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#2907])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3432])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +20 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#787]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#306])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#373])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#309]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#323])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#4302])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#4294])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2316]) +13 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#301]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][80] -> [DMESG-WARN][81] ([Intel XE#4543]) +1 other test dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#651])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#651])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#656]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#5390])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2312]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#653]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#455])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1503]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_hdr@static-swap.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#4298])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#3012]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#5681])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_plane_lowres@tiling-none.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-bmg:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#5175])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-1/igt@kms_plane_multiple@tiling-4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-8/igt@kms_plane_multiple@tiling-4.html
    - shard-dg2-set2:     [PASS][101] -> [DMESG-WARN][102] ([Intel XE#5175])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_plane_multiple@tiling-4.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1406] / [Intel XE#1489])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_psr@psr-no-drrs.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1126])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#261] / [Intel XE#5564])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1392] / [Intel XE#5575])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#1392])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#288] / [Intel XE#5561]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#288]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4943]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#4915]) +34 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4915]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#3573]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#2284] / [Intel XE#366])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][119] -> [DMESG-WARN][120] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4733])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#4733] / [Intel XE#5594])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][123] ([Intel XE#4543]) -> [PASS][124] +7 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@xe_exec_sip@sanity-after-timeout:
    - shard-bmg:          [INCOMPLETE][125] -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@xe_exec_sip@sanity-after-timeout.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@xe_exec_sip@sanity-after-timeout.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [SKIP][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151]) ([Intel XE#378]) -> ([PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-436/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-436/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-436/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-434/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-434/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-434/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-WARN][178] ([Intel XE#5208])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][179] ([Intel XE#2311]) -> [SKIP][180] ([Intel XE#2312]) +19 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][181] ([Intel XE#5390]) -> [SKIP][182] ([Intel XE#2312]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2313]) -> [SKIP][184] ([Intel XE#2312]) +18 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2313])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [FAIL][187] ([Intel XE#4689]) -> [DMESG-FAIL][188] ([Intel XE#4689]) +1 other test dmesg-fail
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][189] ([Intel XE#2509]) -> [SKIP][190] ([Intel XE#2426])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30 -> xe-pw-152277v3

  IGT_8519: 8519
  xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30: ca639a1f013945bb8e5450d625c460b0df195b30
  xe-pw-152277v3: 152277v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/index.html

--===============1883401124226802053==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>User readable error codes on atomic_ioctl fa=
ilure (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152277/">https://patchwork.freedesktop.org/series/152277/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152277v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152277v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3657-ca639a1f013945bb8e5450d625c460b0d=
f195b30_FULL -&gt; xe-pw-152277v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152277v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152277v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1522=
77v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_atom=
ic@atomic-invalid-params.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-3/igt@kms_atomic@atomic-in=
valid-params.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-5/igt@kms_atom=
ic@atomic-invalid-params@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-8/igt@kms_atom=
ic@atomic-invalid-params@pipe-a-dp-2.html">DMESG-FAIL</a> +1 other test dme=
sg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-4/igt@kms_ato=
mic@atomic-invalid-params@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-3/igt@km=
s_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> +1 othe=
r test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@kms_at=
omic@atomic-invalid-params@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@=
kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> +1 ot=
her test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/sha=
rd-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-d=
p-4.html">DMESG-WARN</a> +58 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-d-hdmi-a-2:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_display_modes@extended-=
mode-basic@pipe-c-dp-2-pipe-d-hdmi-a-2.html">DMESG-WARN</a> +27 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_fl=
ip@absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@kms_flip@absolute-wf_=
vblank.html">ABORT</a> +30 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-4/igt@kms_flip@blocking-absolute-wf=
_vblank@a-dp2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@kms_flip@blocking-absolute-=
wf_vblank@a-hdmi-a6.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6=
/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html">DMESG-=
WARN</a> +265 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_plane@plane-position-hol=
e-dpms@pipe-b-plane-1.html">DMESG-WARN</a> +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-1/igt@kms_plan=
e_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-4/ig=
t@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">DMESG-WARN</a>=
 +806 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_properties@plane-properti=
es-legacy@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +41 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-6/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-1/igt@=
kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">DMESG-WARN</a> +80=
0 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-2/igt@kms_vbla=
nk@wait-busy-hang.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152277v3/shard-bmg-1/igt@kms_vblank@wait-busy-hang.h=
tml">ABORT</a> +18 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#46=
83</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2277v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-=
upscaling.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3106">Intel XE#3106</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4683">Intel XE#4683</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-8/igt@kms_flip_scaled_cr=
c@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">DMESG=
-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
77v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-=
blt.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-3/igt@kms_plan=
e@pixel-format-source-clamping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/s=
hard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">=
DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-4/igt@kms_pla=
ne@pixel-format-source-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/=
shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html=
">DMESG-FAIL</a> +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435/igt@kms_pl=
ane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_plane_c=
ursor@viewport.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc=
.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-3/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-7/igt@kms=
_setmode@basic-clone-single-crtc.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@kms_se=
tmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@k=
ms_setmode@basic-clone-single-crtc.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-hang}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_asyn=
c_flips@async-flip-hang.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_async_flips@async=
-flip-hang.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp=
-1-linear-rgb565}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_asyn=
c_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152277v3/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modif=
iers-formats@pipe-a-edp-1-linear-rgb565.html">DMESG-WARN</a> +48 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdm=
i-a-1-linear-xrgb16161616f}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-9/igt@kms_asy=
nc_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-1-linear-xr=
gb16161616f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152277v3/shard-adlp-3/igt@kms_async_flips@basic-modeset-wi=
th-all-modifiers-formats@pipe-a-hdmi-a-1-linear-xrgb16161616f.html">DMESG-W=
ARN</a> +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdm=
i-a-3-x-xyuv8888}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_async_flips@basic-modeset=
-with-all-modifiers-formats@pipe-a-hdmi-a-3-x-xyuv8888.html">DMESG-WARN</a>=
 +35 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3657-ca639a1f013945bb8e5450d62=
5c460b0df195b30_FULL and xe-pw-152277v3_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_hdmi_inject:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152277v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/sha=
rd-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-f=
or-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_color@deep-color.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs=
-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-3/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-8/igt@kms_flip@=
flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_plan=
e_lowres@tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_plane_lowres@tiling-=
none.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5681">Intel XE#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-1/igt@kms_plan=
e_multiple@tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-8/igt@kms_plane_multiple@tiling=
-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5175">Intel XE#5175</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@kms_pl=
ane_multiple@tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@kms_plane_multiple@ti=
ling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@kms_psr@pr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@kms_psr@psr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_eudebug_online@resume-dss=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5565">Intel XE#5565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_evict@evict-beng-large.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe=
_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_fault_mode@many-bind=
execqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@xe_exec_system_allocator@many=
-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_exec_system_allocator@onc=
e-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unm=
ap-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_exec_system_allocator@pr=
ocess-many-large-execqueues-malloc-bo-unmap-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-u=
serptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-2/igt@kms_fli=
p@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/sh=
ard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a>=
 +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@sanity-after-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-7/igt@xe_exec_=
sip@sanity-after-timeout.html">INCOMPLETE</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-bmg-6/igt@xe_exec_sip@sa=
nity-after-timeout.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df=
195b30/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c4=
60b0df195b30/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e545=
0d625c460b0df195b30/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945b=
b8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f0=
13945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca6=
39a1f013945bb8e5450d625c460b0df195b30/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-36=
57-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460b0df19=
5b30/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d625c460=
b0df195b30/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e5450d6=
25c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f013945bb8e=
5450d625c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a1f0139=
45bb8e5450d625c460b0df195b30/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-ca639a=
1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3657-=
ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152277v3/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152277v3/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-436/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152277v3/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg=
2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152277v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152277v3/shard-dg2-435/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v=
3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-433/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152277v3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-466/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152277v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152277v3/shard-dg2-463/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
77v3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152277v3/shard-dg2-464/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
77v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52277v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3=
/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-lnl-7/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/shard-ln=
l-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Inte=
l XE#4689</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v3/sha=
rd-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30 -&gt; xe-pw-152=
277v3</li>
</ul>
<p>IGT_8519: 8519<br />
  xe-3657-ca639a1f013945bb8e5450d625c460b0df195b30: ca639a1f013945bb8e5450d=
625c460b0df195b30<br />
  xe-pw-152277v3: 152277v3</p>

</body>
</html>

--===============1883401124226802053==--
