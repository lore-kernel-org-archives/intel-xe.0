Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438C8C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 18:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067ED10E01F;
	Thu, 20 Feb 2025 18:20:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F20B10E01F;
 Thu, 20 Feb 2025 18:20:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1703147000857650897=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Check_respon?=
 =?utf-8?q?se_data_of_CLIENT=5FSOFT=5FRESET_action?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 18:20:21 -0000
Message-ID: <174007562164.248180.16344219556377342349@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250219192710.281-1-michal.wajdeczko@intel.com>
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

--===============1703147000857650897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
URL   : https://patchwork.freedesktop.org/series/145122/
State : failure

== Summary ==

CI Bug Log - changes from xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb_full -> xe-pw-145122v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145122v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145122v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145122v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +4 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-145122v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#3767]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +26 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#2907])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3862])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#314]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#373]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#309]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2373])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#3321]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#310]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_flip@2x-flip-vs-modeset.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2316]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#2882]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#4330])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#656]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#651]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#653]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#4330]) +4 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#3309])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#4173]) +6 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1489])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#455]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_setmode@clone-exclusive-crtc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#1435])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2905])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#288]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#3876])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][55] -> [DMESG-WARN][56] ([Intel XE#4330]) +6 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2953]) +2 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@xe_module_load@many-reload.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][59] ([Intel XE#4268]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@xe_pm@s4-basic.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [DMESG-WARN][60] ([Intel XE#4173]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-4/igt@core_hotunplug@unbind-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-dg2-set2:     [DMESG-WARN][62] ([Intel XE#4330]) -> [PASS][63] +8 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_addfb_basic@unused-pitches.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#4330]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][66] ([Intel XE#3908]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][68] ([Intel XE#4330]) -> [PASS][69] +18 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][70] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][72] ([Intel XE#4345]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][74] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#3124]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#309]) -> [PASS][81] +2 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][82] ([Intel XE#2291]) -> [PASS][83] +5 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][84] ([Intel XE#3009]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_dp_aux_dev.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#310]) -> [PASS][87] +2 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#301]) -> [PASS][89] +2 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#2955]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][92] ([Intel XE#2316]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [FAIL][94] ([Intel XE#2882]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][96] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][98] ([Intel XE#4330]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#656]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][102] ([Intel XE#1503]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][104] ([Intel XE#877]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][106] -> [PASS][107] +4 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [DMESG-WARN][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
    - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#2042]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][112] ([Intel XE#1435]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][114] ([Intel XE#899]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [FAIL][116] ([Intel XE#4278]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][118] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#787]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][124] ([Intel XE#2341]) -> [FAIL][125] ([Intel XE#1178])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_content_protection@srm.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#1178]) -> [SKIP][127] ([Intel XE#455])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_content_protection@srm.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [DMESG-WARN][128] ([Intel XE#4330]) -> [SKIP][129] ([Intel XE#2291])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [DMESG-WARN][130] ([Intel XE#4330]) -> [SKIP][131] ([Intel XE#309]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][132] ([Intel XE#2291]) -> [DMESG-WARN][133] ([Intel XE#4330])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][134] ([Intel XE#3321]) -> [SKIP][135] ([Intel XE#2316])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][136] ([Intel XE#2316]) -> [FAIL][137] ([Intel XE#3321])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#301]) -> [SKIP][139] ([Intel XE#310])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#2955]) -> [SKIP][141] ([Intel XE#2316])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [DMESG-WARN][142] ([Intel XE#2955]) -> [SKIP][143] ([Intel XE#310])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][144] ([Intel XE#2311]) -> [SKIP][145] ([Intel XE#2312]) +16 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][146] ([Intel XE#2312]) -> [SKIP][147] ([Intel XE#4141]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [DMESG-WARN][148] ([Intel XE#4330]) -> [SKIP][149] ([Intel XE#656]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][150] ([Intel XE#4141]) -> [SKIP][151] ([Intel XE#2312]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#2311]) +17 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#651]) -> [SKIP][155] ([Intel XE#656]) +10 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#656]) -> [SKIP][157] ([Intel XE#651]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#2313]) +16 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#656]) -> [SKIP][161] ([Intel XE#653]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][162] ([Intel XE#2313]) -> [SKIP][163] ([Intel XE#2312]) +18 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#653]) -> [SKIP][165] ([Intel XE#656]) +13 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#4330]) -> [SKIP][167] ([Intel XE#455])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#362]) -> [SKIP][169] ([Intel XE#1500])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb -> xe-pw-145122v1

  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb: c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb
  xe-pw-145122v1: 145122v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/index.html

--===============1703147000857650897==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Check response data of CLIENT_SOFT_RESET action</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145122/">https://patchwork.freedesktop.org/series/145122/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb_full -&gt; xe-pw-145122v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145122v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-145122v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-145122v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-8/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145122v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_addfb_basic@unused-pitches.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145122v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb -&gt; xe-pw-145122v1</li>
</ul>
<p>IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2691-c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb: c56a9ffde128dcbaf085ec61a4e8fd9a26448ebb<br />
  xe-pw-145122v1: 145122v1</p>

</body>
</html>

--===============1703147000857650897==--
