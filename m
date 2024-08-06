Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEC3C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 15:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EA210E39C;
	Tue,  6 Aug 2024 15:06:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFEC10E3A6;
 Tue,  6 Aug 2024 15:06:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1266051221424942230=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_HDMI_PLL_Algorithm_for_SNPS?=
 =?utf-8?q?/C10PHY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 15:06:25 -0000
Message-ID: <172295678510.543479.14958678012161259230@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
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

--===============1266051221424942230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev2)
URL   : https://patchwork.freedesktop.org/series/135396/
State : failure

== Summary ==

CI Bug Log - changes from xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_full -> xe-pw-135396v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135396v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135396v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135396v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +85 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3}:
    - {shard-bmg}:        [PASS][3] -> [DMESG-WARN][4] +7 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * {igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3}:
    - {shard-bmg}:        [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@xe_module_load@many-reload:
    - {shard-bmg}:        [WARN][7] ([Intel XE#2357]) -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-2/igt@xe_module_load@many-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-7/igt@xe_module_load@many-reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-135396v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#324])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1659]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#1252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#599])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#307])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#877]) +2 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#877]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][27] ([Intel XE#2019]) +1 other test dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#1874]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#651])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#653])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#455])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1162])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-lnl:          NOTRUN -> [FAIL][39] ([Intel XE#2028])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#361])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#498])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1705]) +1 other test dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#929])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#327])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2187])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@testdisplay.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-466/igt@testdisplay.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1600])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1069])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#288]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1620])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#1192] / [Intel XE#1201])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@bad-extensions:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2226]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@xe_mmap@bad-extensions.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-4/igt@xe_mmap@bad-extensions.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#2207])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#1358] / [Intel XE#1794])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][67] -> [ABORT][68] ([Intel XE#1794])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][70] ([Intel XE#1426]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][72] ([Intel XE#1659]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#367]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#367]) -> [PASS][77] +5 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][78] ([Intel XE#2436]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - {shard-bmg}:        [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html

  * {igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3}:
    - {shard-bmg}:        [INCOMPLETE][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][84] ([Intel XE#1195]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][86] -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][88] ([Intel XE#886]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][90] ([Intel XE#1874]) -> [PASS][91] +2 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [i915#5274]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [FAIL][94] ([Intel XE#2028]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#2019]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][98] ([Intel XE#324]) -> [PASS][99] +4 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][102] ([Intel XE#899]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][104] ([Intel XE#899]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][106] ([Intel XE#1523]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-6/igt@kms_vblank@accuracy-idle.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][110] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][112] ([Intel XE#1473]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-virtual-userptr:
    - {shard-bmg}:        [DMESG-WARN][114] -> [PASS][115] +7 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@xe_exec_balancer@once-virtual-userptr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-4/igt@xe_exec_balancer@once-virtual-userptr.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][116] ([Intel XE#1069]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][118] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@xe_module_load@many-reload.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          [FAIL][120] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][122] ([Intel XE#958]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#1033]) -> [DMESG-WARN][125] ([Intel XE#2338])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#873]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#873])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#316]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][131] ([Intel XE#316]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][132] ([Intel XE#324]) -> [FAIL][133] ([Intel XE#1204])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][134] ([Intel XE#1231]) -> [DMESG-FAIL][135] ([Intel XE#324]) +1 other test dmesg-fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][136] ([Intel XE#324]) -> [FAIL][137] ([Intel XE#1231])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][138] ([Intel XE#324]) -> [FAIL][139] ([Intel XE#1231])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1124]) -> [SKIP][141] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#610]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#610])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][145] ([Intel XE#1124]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#2191]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#2191])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][149] ([Intel XE#2191])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#367]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][153] ([Intel XE#367]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][155] ([Intel XE#787]) +34 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][157] ([Intel XE#1252]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#787]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][163] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][165] ([Intel XE#306])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#306]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#373]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][171] ([Intel XE#373]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#308]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#308])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][175] ([Intel XE#308]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#323]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#323])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][178] ([i915#3804]) -> [SKIP][179] ([Intel XE#1201] / [i915#3804])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#455]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][182] ([Intel XE#1195] / [Intel XE#2019]) -> [DMESG-WARN][183] ([Intel XE#2019])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#651]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][187] ([Intel XE#651]) +20 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#658]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#658])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][191] ([Intel XE#653]) +21 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#653]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#356]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#356])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [INCOMPLETE][196] -> [FAIL][197] ([Intel XE#2028]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#1195]) -> [SKIP][199] ([Intel XE#455] / [Intel XE#498])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][201] ([Intel XE#498]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][202] ([Intel XE#1195]) -> [SKIP][203] ([Intel XE#498])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][205] ([Intel XE#870])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#908]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#908]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][209] ([Intel XE#1204])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][211] ([Intel XE#1489]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1489]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][215] ([Intel XE#1122])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#929]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][219] ([Intel XE#929]) +9 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr@psr2-basic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#327]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#327])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][223] ([Intel XE#327]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#455]) +13 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_vrr@flipline.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#756]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1123]) -> [SKIP][229] ([Intel XE#1123] / [Intel XE#1201])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1126]) -> [SKIP][231] ([Intel XE#1126] / [Intel XE#1201])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][233] ([Intel XE#1126])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][234] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][235] ([Intel XE#1473] / [Intel XE#392])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#288]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][239] ([Intel XE#288]) +16 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][241] ([Intel XE#255])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][242] ([Intel XE#1999]) -> [SKIP][243] ([Intel XE#1192])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][245] ([Intel XE#560])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#378]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#378])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#2207]) -> [SKIP][249] ([Intel XE#2207]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2207]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#2207]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_oa@non-zero-reason.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_oa@non-zero-reason.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1337]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#1337])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][255] ([Intel XE#979])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][257] ([Intel XE#944])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#944]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2187]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2187
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f -> xe-pw-135396v2

  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1719-38af90f98c71935da87b28c0552f32d175352d9f: 38af90f98c71935da87b28c0552f32d175352d9f
  xe-pw-135396v2: 135396v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html

--===============1266051221424942230==
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
<tr><td><b>Series:</b></td><td>Add HDMI PLL Algorithm for SNPS/C10PHY (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135396/">https://patchwork.freedesktop.org/series/135396/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_full -&gt; xe-pw-135396v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135396v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135396v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135396v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-6.html">DMESG-WARN</a> +85 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-2/igt@xe_module_load@many-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357">Intel XE#2357</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-7/igt@xe_module_load@many-reload.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135396v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-466/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2187">Intel XE#2187</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-extensions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@xe_mmap@bad-extensions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-4/igt@xe_mmap@bad-extensions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-6/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@xe_exec_balancer@once-virtual-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-bmg-4/igt@xe_exec_balancer@once-virtual-userptr.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-2/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-4/igt@xe_pm@s2idle-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f -&gt; xe-pw-135396v2</li>
</ul>
<p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1719-38af90f98c71935da87b28c0552f32d175352d9f: 38af90f98c71935da87b28c0552f32d175352d9f<br />
  xe-pw-135396v2: 135396v2</p>

</body>
</html>

--===============1266051221424942230==--
