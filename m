Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7740C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B2E10E586;
	Tue,  9 Jul 2024 15:14:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00BB10E586;
 Tue,  9 Jul 2024 15:14:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1214924482697845065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2=3A_Add_Wa=5F15015404?=
 =?utf-8?q?425_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 15:14:29 -0000
Message-ID: <172053806984.86386.18391626355879855875@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
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

--===============1214924482697845065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add Wa_15015404425 (rev4)
URL   : https://patchwork.freedesktop.org/series/135679/
State : failure

== Summary ==

CI Bug Log - changes from xe-1579-b517815c3f82589b802e2dccb11c8585fda13979_full -> xe-pw-135679v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135679v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135679v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135679v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-435/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_queue_property:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-7/igt@xe_exec_queue_property.html

  * {igt@xe_oa@unprivileged-single-ctx-counters}:
    - {shard-lnl}:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-8/igt@xe_oa@unprivileged-single-ctx-counters.html

  
Known issues
------------

  Here are the changes found in xe-pw-135679v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#623])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][8] ([Intel XE#1874]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#1252])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#1252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#307])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#308])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#309])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#323])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#776])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#702])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195] / [Intel XE#2049])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1874]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1861])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#656]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#2058])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#361])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#718])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#908])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1149] / [Intel XE#1201])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1127] / [Intel XE#1201])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-basic:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_vrr@flip-basic.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1091] / [Intel XE#1201])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1123] / [Intel XE#1201])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473] / [Intel XE#392]) +2 other tests timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][53] -> [TIMEOUT][54] ([Intel XE#1473])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-436/igt@xe_evict@evict-threads-large.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#688])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#1392])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1337])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#979])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][64] -> [ABORT][65] ([Intel XE#1358])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@xe_pm@s4-basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#579])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][68] ([Intel XE#1760])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - {shard-lnl}:        [FAIL][69] ([Intel XE#911]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - {shard-lnl}:        [FAIL][71] ([Intel XE#886]) -> [PASS][72] +4 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][73] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][75] ([Intel XE#1195]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][77] ([Intel XE#1874]) -> [PASS][78] +4 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane@plane-position-covered:
    - {shard-lnl}:        [DMESG-FAIL][79] ([Intel XE#324]) -> [PASS][80] +3 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * {igt@kms_plane@plane-position-covered@pipe-b-plane-1}:
    - {shard-lnl}:        [DMESG-WARN][81] ([Intel XE#324]) -> [PASS][82] +3 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#361]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc6-psr:
    - {shard-lnl}:        [FAIL][85] ([Intel XE#1430]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][87] ([Intel XE#771] / [Intel XE#899]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [FAIL][89] ([Intel XE#771] / [Intel XE#899]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][91] ([Intel XE#899]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#899]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@flipline:
    - {shard-lnl}:        [INCOMPLETE][95] -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-4/igt@kms_vrr@flipline.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - {shard-lnl}:        [DMESG-WARN][97] ([Intel XE#1638]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#1414]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][101] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][103] ([Intel XE#324]) -> [FAIL][104] ([Intel XE#1204])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][105] ([Intel XE#324]) -> [FAIL][106] ([Intel XE#1231])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#1551])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][110] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][112] ([Intel XE#1729])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1579-b517815c3f82589b802e2dccb11c8585fda13979 -> xe-pw-135679v4

  IGT_7920: 7920
  xe-1579-b517815c3f82589b802e2dccb11c8585fda13979: b517815c3f82589b802e2dccb11c8585fda13979
  xe-pw-135679v4: 135679v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/index.html

--===============1214924482697845065==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add Wa_15015404425 (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135679/">https://patchwork.freedesktop.org/series/135679/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1579-b517815c3f82589b802e2dccb11c8585fda13979_full -&gt; xe-pw-135679v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135679v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135679v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135679v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-435/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_exec_queue_property:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-7/igt@xe_exec_queue_property.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@unprivileged-single-ctx-counters}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-8/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135679v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058">Intel XE#2058</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-435/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-b-plane-1}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-4/igt@kms_vrr@flipline.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-8/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-433/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1579-b517815c3f82589b802e2dccb11c8585fda13979/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135679v4/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1579-b517815c3f82589b802e2dccb11c8585fda13979 -&gt; xe-pw-135679v4</li>
</ul>
<p>IGT_7920: 7920<br />
  xe-1579-b517815c3f82589b802e2dccb11c8585fda13979: b517815c3f82589b802e2dccb11c8585fda13979<br />
  xe-pw-135679v4: 135679v4</p>

</body>
</html>

--===============1214924482697845065==--
