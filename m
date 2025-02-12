Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA40BC021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 09:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643D210E820;
	Wed, 12 Feb 2025 09:36:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA47310E81B;
 Wed, 12 Feb 2025 09:36:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2618046010832259431=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/hwmon=3A_expose_fan?=
 =?utf-8?q?_speed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 09:36:02 -0000
Message-ID: <173935296288.1246876.3909744686198241880@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210100515.2205584-1-raag.jadav@intel.com>
In-Reply-To: <20250210100515.2205584-1-raag.jadav@intel.com>
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

--===============2618046010832259431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: expose fan speed
URL   : https://patchwork.freedesktop.org/series/144581/
State : failure

== Summary ==

CI Bug Log - changes from xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5_full -> xe-pw-144581v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144581v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144581v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144581v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  
New tests
---------

  New tests have been introduced between xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5_full and xe-pw-144581v1_full:

### New IGT tests (2) ###

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  

Known issues
------------

  Here are the changes found in xe-pw-144581v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2191])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#4010]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][10] ([Intel XE#3124] / [Intel XE#4010])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] ([Intel XE#1727])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2291]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#3009])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-2/igt@kms_dp_aux_dev.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2316]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#2882]) +5 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#3321]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [PASS][23] -> [INCOMPLETE][24] ([Intel XE#2049] / [Intel XE#2597])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-5/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#2882]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1033])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#616]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_plane_cursor@viewport.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#2953])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][33] ([Intel XE#4170])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_vblank@query-forked-hang@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][34] ([Intel XE#4172]) +2 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1091] / [Intel XE#2849])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2322])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][37] -> [DMESG-WARN][38] ([Intel XE#4172]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#4173])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2229])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1192])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][44] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][46] ([Intel XE#3124] / [Intel XE#4010]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][48] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][50] ([Intel XE#4173]) -> [PASS][51] +3 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [DMESG-WARN][52] ([Intel XE#4172]) -> [PASS][53] +10 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][54] ([Intel XE#2291]) -> [PASS][55] +2 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][56] ([Intel XE#2425]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][58] ([Intel XE#1340]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][60] ([Intel XE#2316]) -> [PASS][61] +6 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][62] ([Intel XE#3321]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][64] ([Intel XE#301]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1033]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][68] ([Intel XE#656]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][70] ([Intel XE#1430]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-lnl:          [INCOMPLETE][72] -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-2/igt@kms_rotation_crc@multiplane-rotation.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][74] ([Intel XE#1435]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][76] ([Intel XE#899]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][78] ([Intel XE#1192]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#787]) -> [SKIP][81] ([Intel XE#455] / [Intel XE#787])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-WARN][82] -> [DMESG-WARN][83] ([Intel XE#4172])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-1/igt@kms_color@deep-color.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][84] ([Intel XE#1178]) -> [SKIP][85] ([Intel XE#2341])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_content_protection@atomic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][86] ([Intel XE#877]) -> [SKIP][87] ([Intel XE#2291])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][88] ([Intel XE#3321]) -> [SKIP][89] ([Intel XE#2316])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#4172]) -> [DMESG-FAIL][91] ([Intel XE#4172])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][92] ([Intel XE#2311]) -> [SKIP][93] ([Intel XE#2312]) +19 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][94] ([Intel XE#2312]) -> [SKIP][95] ([Intel XE#2311]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][96] ([Intel XE#4141]) -> [SKIP][97] ([Intel XE#2312]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][98] ([Intel XE#2312]) -> [SKIP][99] ([Intel XE#4141]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#656]) -> [SKIP][101] ([Intel XE#651])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][102] ([Intel XE#2312]) -> [SKIP][103] ([Intel XE#2313]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#656]) -> [SKIP][105] ([Intel XE#653]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][106] ([Intel XE#2313]) -> [SKIP][107] ([Intel XE#2312]) +19 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][108] ([Intel XE#3544]) -> [SKIP][109] ([Intel XE#3374] / [Intel XE#3544])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4170]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4170
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5 -> xe-pw-144581v1

  IGT_8227: 8227
  xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5: cf1e5b2c409816453391f452b44c10f4e9c27ff5
  xe-pw-144581v1: 144581v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/index.html

--===============2618046010832259431==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: expose fan speed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144581/">https://patchwork.freedesktop.org/series/144581/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5_full -&gt; xe-pw-144581v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144581v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144581v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144581v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms@plane-41:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5_full and xe-pw-144581v1_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144581v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-5/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4170">Intel XE#4170</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-2/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-1/igt@kms_color@deep-color.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-1/igt@kms_color@deep-color.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144581v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5 -&gt; xe-pw-144581v1</li>
</ul>
<p>IGT_8227: 8227<br />
  xe-2626-cf1e5b2c409816453391f452b44c10f4e9c27ff5: cf1e5b2c409816453391f452b44c10f4e9c27ff5<br />
  xe-pw-144581v1: 144581v1</p>

</body>
</html>

--===============2618046010832259431==--
