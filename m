Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91940606D81F
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B2D10E3F6;
	Thu,  5 Nov 2026 00:49:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBC510E3F2;
 Thu,  5 Nov 2026 00:49:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7824391845447851184=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/ras=3A_Remove_unnec?=
 =?utf-8?q?essary_SIGID_logging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 00:49:17 -0000
Message-ID: <179383975730.121744.15751893368584691816@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104090701.1748619-2-riana.tauro@intel.com>
In-Reply-To: <20261104090701.1748619-2-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7824391845447851184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ras: Remove unnecessary SIGID logging
URL   : https://patchwork.freedesktop.org/series/177696/
State : success

== Summary ==

CI Bug Log - changes from xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560_FULL -> xe-pw-177696v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560_FULL and xe-pw-177696v1_FULL:

### New IGT tests (78) ###

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-basic:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 4.95] s

  * igt@kms_sharpness_filter@filter-basic@pipe-a-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.43] s

  * igt@kms_sharpness_filter@filter-basic@pipe-b-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.49] s

  * igt@kms_sharpness_filter@filter-basic@pipe-c-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.49] s

  * igt@kms_sharpness_filter@filter-basic@pipe-d-edp-1-basic:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-dpms:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 6.98] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-a-edp-1-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-b-edp-1-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-c-edp-1-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.42] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-a-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.46] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-b-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.50, 1.61] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-c-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.57, 1.61] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-d-edp-1-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.22] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-a-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.49] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-b-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.57] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-c-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.60] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-d-edp-1-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_sharpness_filter@filter-strength:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 29.13] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.43] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.52] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.52] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.54] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.54] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.48] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-191:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-255:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-suspend:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 9.96] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:
    - Statuses : 2 pass(s)
    - Exec time: [3.65, 5.04] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend:
    - Statuses : 1 pass(s)
    - Exec time: [4.66] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-d-edp-1-suspend:
    - Statuses : 1 pass(s)
    - Exec time: [4.88] s

  * igt@kms_sharpness_filter@filter-tap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.07] s

  * igt@kms_sharpness_filter@filter-tap@pipe-a-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.33] s

  * igt@kms_sharpness_filter@filter-tap@pipe-b-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.37] s

  * igt@kms_sharpness_filter@filter-tap@pipe-c-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.34] s

  * igt@kms_sharpness_filter@filter-tap@pipe-d-edp-1-tap-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_sharpness_filter@filter-toggle:
    - Statuses : 1 pass(s)
    - Exec time: [3.85] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-a-edp-1-toggle:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-b-edp-1-toggle:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-c-edp-1-toggle:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 1.52] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-a-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.44] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-b-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.35] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-c-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.35] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-d-edp-1-invalid-filter-with-plane:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 0.53] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-a-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.14] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-b-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-c-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-d-edp-1-invalid-filter-with-scaler:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 10.79] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.48] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.33] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.50] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.40] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.51] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.51] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 4.86] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.36] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-b-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.43] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-c-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 1.52] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-d-edp-1-invalid-plane-with-filter:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  

Known issues
------------

  Here are the changes found in xe-pw-177696v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2370])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5901])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5808]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7679])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5822]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#8391]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6969]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#7642])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#3304]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7642])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5846])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5962])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2286] / [Intel XE#6035])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#9536])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#9539])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8265]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5907]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#8265])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4156] / [Intel XE#7425])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2373] / [Intel XE#7448])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1138] / [Intel XE#7344])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#2316]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#301]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7178]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7178] / [Intel XE#7351])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7179])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2311]) +24 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7061])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4141]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5800] / [Intel XE#6312])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6312] / [Intel XE#651])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#6312]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6312]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7905]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7061]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7061]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7865]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#7399])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5812]) +22 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +27 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#7865]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8303]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7283])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7283]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#7283]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5020])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#5020] / [Intel XE#7348])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7304])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1489]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#1406])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_sharpness_filter@filter-suspend (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6503]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#9271])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [PASS][82] -> [FAIL][83] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-1/igt@kms_vrr@flip-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1499] / [Intel XE#9271])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5764]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6540] / [Intel XE#688])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#7482]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_balancer@once-virtual-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7482]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1392])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][92] -> [FAIL][93] ([Intel XE#8578])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_exec_fault_mode@atomic-many.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#8374]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#8374]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#8374]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#8364]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#8364]) +13 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_multi_queue@max-queues-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#8364]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_exec_multi_queue@max-queues-dyn-priority.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][100] ([Intel XE#8652])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#8058])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8378]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#8378]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#8378]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#6964])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#7793])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#7793])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#7590])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_pat@xa-app-transient-media-on.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#7590] / [Intel XE#7772])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#6867])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][113] -> [ABORT][114] ([Intel XE#9362])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [PASS][115] -> [ABORT][116] ([Intel XE#9362]) +1 other test abort
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-7/igt@xe_pm@s4-vm-bind-prefetch.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#9254])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#6019])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#6376] / [Intel XE#7422])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_sriov_vram@vf-access-beyond.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_sriov_vram@vf-access-beyond.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-ptl:          [FAIL][125] ([Intel XE#6078]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][127] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][129] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][131] ([Intel XE#3098]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][133] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-3/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-bmg:          [ABORT][135] ([Intel XE#9481]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][137] ([Intel XE#9362]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-8/igt@xe_pm@s4-basic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][139] ([Intel XE#9362]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][141] ([Intel XE#9254]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][143] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][144] ([Intel XE#3544])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][145] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][146] ([Intel XE#1729] / [Intel XE#7424])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][147] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][148] ([Intel XE#2426] / [Intel XE#5848])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9481]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481
  [Intel XE#9536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536
  [Intel XE#9539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539


Build changes
-------------

  * Linux: xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560 -> xe-pw-177696v1

  IGT_9177: 9177
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560
  xe-pw-177696v1: 177696v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/index.html

--===============7824391845447851184==
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
<tr><td><b>Series:</b></td><td>drm/xe/ras: Remove unnecessary SIGID logging</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177696/">https://patchwork.freedesktop.org/series/177696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560_FULL -&gt; xe-pw-177696v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560_FULL and xe-pw-177696v1_FULL:</p>
<h3>New IGT tests (78)</h3>
<ul>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-a-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-b-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-c-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-d-edp-1-basic:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-a-edp-1-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-b-edp-1-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-c-edp-1-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-a-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-b-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.50, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-c-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.57, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-d-edp-1-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-a-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-b-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-c-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-d-edp-1-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 29.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-191:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-255:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 9.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.65, 5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-d-edp-1-suspend:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-a-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-b-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-c-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-d-edp-1-tap-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-a-edp-1-toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-b-edp-1-toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-c-edp-1-toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-a-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-b-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-c-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-d-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-a-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-b-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-c-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-d-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 10.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-b-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.42, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-c-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-d-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177696v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536">Intel XE#9536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539">Intel XE#9539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +22 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_plane_multiple@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_exec_multi_queue@max-queues-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058">Intel XE#8058</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-6/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-3/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481">Intel XE#9481</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-ptl-8/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-ptl-2/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177696v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560 -&gt; xe-pw-177696v1</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560<br />
  xe-pw-177696v1: 177696v1</p>

</body>
</html>

--===============7824391845447851184==--
