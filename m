Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DEDCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 23:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD7710E813;
	Wed, 24 Sep 2025 23:39:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C79B10E813;
 Wed, 24 Sep 2025 23:39:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6271185184145575672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/migrate=3A_Revamp_P?=
 =?utf-8?q?AT_index_selection_for_migrate_PTEs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 23:39:06 -0000
Message-ID: <175875714616.364597.3270058662889944280@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
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

--===============6271185184145575672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Revamp PAT index selection for migrate PTEs (rev2)
URL   : https://patchwork.freedesktop.org/series/154629/
State : failure

== Summary ==

CI Bug Log - changes from xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf_FULL -> xe-pw-154629v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154629v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154629v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154629v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-edp-1:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +4 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-edp-1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +11 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [PASS][5] -> [ABORT][6] +17 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][7] +12 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec_reset@cm-close-fd.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - shard-bmg:          NOTRUN -> [ABORT][10] +6 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_exec_system_allocator@many-new-bo-map.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][11] ([Intel XE#2291]) -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][13] ([Intel XE#2316]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][15] ([Intel XE#5390]) -> [ABORT][16] +2 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][17] ([Intel XE#2311]) -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][19] ([Intel XE#2313]) -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#653]) -> [ABORT][22] +2 other tests abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][23] ([Intel XE#616]) -> [ABORT][24] +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-accuracy-90}:
    - shard-lnl:          [PASS][25] -> [FAIL][26] +3 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html

  * {igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0}:
    - shard-bmg:          NOTRUN -> [FAIL][27] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
Known issues
------------

  Here are the changes found in xe-pw-154629v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#3157])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3157])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#3884]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1124]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#316])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][33] ([Intel XE#4543]) +3 other tests dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2191]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2191])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#2907])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#787]) +13 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#787]) +14 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#309])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#4302])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-render@xbgr16161616f-untiled:
    - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#3876]) +19 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_draw_crc@draw-method-render@xbgr16161616f-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@kms_draw_crc@draw-method-render@xbgr16161616f-untiled.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#776])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#776])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1137])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#310]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][55] ([Intel XE#4543]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_flip@basic-plain-flip@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#4543]) +10 other tests dmesg-warn
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][58] -> [DMESG-FAIL][59] ([Intel XE#4543]) +1 other test dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#651]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#653]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#656]) +14 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#2925])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-8/igt@kms_mmap_write_crc@main.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][66] -> [ABORT][67] ([Intel XE#3970]) +24 other tests abort
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@kms_plane_cursor@primary.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1122])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][69] ([Intel XE#718])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-lnl:          NOTRUN -> [ABORT][70] ([Intel XE#3970]) +1 other test abort
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_psr@psr-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#3414])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#455]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1126])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#4837] / [Intel XE#5565]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#688]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#288]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#288] / [Intel XE#5561]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#4915]) +102 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@xe_exec_system_allocator@many-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4943])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4915]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-stride-mmap-shared.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#3573])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_oa@oa-formats.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#3573]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#4733] / [Intel XE#5594])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][89] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][91] ([Intel XE#4543]) -> [PASS][92] +9 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_plane_lowres@tiling-x.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-adlp:         [SKIP][95] ([Intel XE#6070]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_pm_rpm@basic-pci-d3-state.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_exec_basic@once-userptr-rebind:
    - shard-adlp:         [INCOMPLETE][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec_basic@once-userptr-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_exec_basic@once-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-free:
    - shard-adlp:         [FAIL][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-userptr-free.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-userptr-free.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][101] ([Intel XE#3876]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - shard-adlp:         [DMESG-FAIL][103] ([Intel XE#3876]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([SKIP][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130]) ([Intel XE#378]) -> ([PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-5/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [SKIP][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) ([Intel XE#2457]) -> ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [SKIP][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221]) ([Intel XE#378]) -> ([PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-433/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-433/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-466/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-464/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-464/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-466/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-434/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-434/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-463/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-463/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-FAIL][243] ([Intel XE#5545]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][245] ([Intel XE#4543]) -> [DMESG-WARN][246] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-lnl:          [SKIP][247] ([Intel XE#651]) -> [ABORT][248] ([Intel XE#3970])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][249] ([Intel XE#4543]) -> [FAIL][250] ([Intel XE#5671])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][251] ([Intel XE#656]) -> [ABORT][252] ([Intel XE#3970]) +1 other test abort
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][253] ([Intel XE#734]) -> [FAIL][254] ([Intel XE#3325])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][255] ([Intel XE#1406] / [Intel XE#2893]) -> [ABORT][256] ([Intel XE#3970])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          [FAIL][257] ([Intel XE#4689]) -> [ABORT][258] ([Intel XE#3970] / [Intel XE#4689])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [INCOMPLETE][259] ([Intel XE#3088]) -> [DMESG-WARN][260] ([Intel XE#2953] / [Intel XE#3088] / [Intel XE#4173]) +1 other test dmesg-warn
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671
  [Intel XE#6070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6070
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6190]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * IGT: IGT_8550 -> IGT_8551
  * Linux: xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf -> xe-pw-154629v2

  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8551: 8551
  xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: a4d9163251f4832a7d34d4b59449f9a68b9b7adf
  xe-pw-154629v2: 154629v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/index.html

--===============6271185184145575672==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Revamp PAT index selection f=
or migrate PTEs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154629/">https://patchwork.freedesktop.org/series/154629/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154629v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154629v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3825-a4d9163251f4832a7d34d4b59449f9a68=
b9b7adf_FULL -&gt; xe-pw-154629v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154629v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154629v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1546=
29v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels@pipe-b-edp-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-internal-panels@pipe-b-edp-1.html">DMESG-WARN</a> +4 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-433/igt@kms_fl=
ip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@=
kms_flip@2x-plain-flip-fb-recreate-interruptible.html">ABORT</a> +11 other =
tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2/igt@kms_rota=
tion_crc@multiplane-rotation.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@kms_rotation_crc=
@multiplane-rotation.html">ABORT</a> +17 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@kms_vblank@ts-continuation-=
dpms-suspend@pipe-a-hdmi-a-2.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_exec_system_allocator@many=
-new-bo-map.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-=
bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">ABORT</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v=
2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154629v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-mmap-wc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msf=
lip-blt.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">ABORT</a> +2 other tests=
 abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt@kms_pl=
ane_cursor@primary@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-=
dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html">ABORT</a=
> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_pmu@engine-activity-accuracy-90}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-90.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_pmu@engine-acti=
vity-accuracy-90.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compu=
te0}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_pmu@engine-activity-accura=
cy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> +2 other tests fai=
l</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154629v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@kms_async_flips@crc-atomic@p=
ipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests=
 dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_bw@linear-tiling-4-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xbgr16161616f-untiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_draw=
_crc@draw-method-render@xbgr16161616f-untiled.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/ig=
t@kms_draw_crc@draw-method-render@xbgr16161616f-untiled.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Int=
el XE#3876</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_flip@basic-plain-flip@d-=
hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_fli=
p@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_f=
lip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp=
-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-8/igt@kms_mma=
p_write_crc@main.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_mmap_write_crc@main.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@kms_plan=
e_cursor@primary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@kms_plane_cursor@primary.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3970">Intel XE#3970</a>) +24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@kms_pm_rpm@basic-rte.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/397=
0">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_psr@fbc-psr2-primary-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@kms_psr@psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_eudebug@basic-read-event.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5565">Intel XE#5565</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-ex=
ec-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_exec_fault_mode@invalid-=
va.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_exec_fault_mode@twice-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@xe_exec_system_allocator@man=
y-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4915">Intel XE#4915</a>) +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-many-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_oa@oa-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">=
Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/igt@xe_oa@unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v=
2/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adl=
p-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +9 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_pla=
ne_lowres@tiling-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-ad=
lp-9/igt@kms_plane_lowres@tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_pm_=
rpm@basic-pci-d3-state.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6070">Intel XE#6070</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_pm_=
rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec=
_basic@once-userptr-rebind.html">INCOMPLETE</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@xe_exec_bas=
ic@once-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-free:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec=
_compute_mode@many-execqueues-userptr-free.html">FAIL</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-3/igt@x=
e_exec_compute_mode@many-execqueues-userptr-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_exec=
_threads@threads-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
29v2/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b=
7adf/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a6=
8b9b7adf/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449=
f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b5=
9449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34=
d4b59449f9a68b9b7adf/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a=
7d34d4b59449f9a68b9b7adf/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4=
832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d91632=
51f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9=
163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-=
a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7ad=
f/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154629v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154629v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154629v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b=
7adf/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a6=
8b9b7adf/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449=
f9a68b9b7adf/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b5=
9449f9a68b9b7adf/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34=
d4b59449f9a68b9b7adf/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a=
7d34d4b59449f9a68b9b7adf/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4=
832a7d34d4b59449f9a68b9b7adf/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d91632=
51f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9=
163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-=
a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154629v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-433/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf=
/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b=
9b7adf/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449=
f9a68b9b7adf/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d=
4b59449f9a68b9b7adf/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832=
a7d34d4b59449f9a68b9b7adf/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d916325=
1f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d=
9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-38=
25-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-463/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b=
7adf/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shar=
d-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-154629v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
629v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-154629v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/sha=
rd-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154629v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4629v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-432/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-154629v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154629v2/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-4/i=
gt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-6/=
igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-7=
/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-154629v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pr=
i-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5671">Intel XE#5671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/=
shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Inte=
l XE#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-154629v2/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
exceed-sf.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-lnl-1/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-lnl-=
7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689"=
>Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/shard-adlp-9/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/shard-adlp-9/i=
gt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#=
3088</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8550 -&gt; IGT_8551</li>
<li>Linux: xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf -&gt; xe-pw-154=
629v2</li>
</ul>
<p>IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8551: 8551<br />
  xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: a4d9163251f4832a7d34d4b=
59449f9a68b9b7adf<br />
  xe-pw-154629v2: 154629v2</p>

</body>
</html>

--===============6271185184145575672==--
