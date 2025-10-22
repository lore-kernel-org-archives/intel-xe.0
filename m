Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D50ECCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 04:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD610E69F;
	Wed, 22 Oct 2025 04:15:12 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CDB10E69F;
 Wed, 22 Oct 2025 04:15:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9214541060987950408=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Minor_fixes_t?=
 =?utf-8?q?o_post-migration_recovery_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 04:15:11 -0000
Message-ID: <176110651153.39919.4050214744158103039@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021224817.1593817-1-tomasz.lis@intel.com>
In-Reply-To: <20251021224817.1593817-1-tomasz.lis@intel.com>
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

--===============9214541060987950408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Minor fixes to post-migration recovery (rev7)
URL   : https://patchwork.freedesktop.org/series/155865/
State : failure

== Summary ==

CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -> xe-pw-155865v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155865v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155865v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155865v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - shard-adlp:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Warnings ####

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [FAIL][5] ([Intel XE#6325]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html

  
Known issues
------------

  Here are the changes found in xe-pw-155865v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#6168])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1727] / [Intel XE#3113])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +27 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#306]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#373]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#308])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#1475])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#4633])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#323])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1340])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2316]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#2049] / [Intel XE#4842])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#301] / [Intel XE#3149])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#4543]) +6 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4543] / [Intel XE#5208])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#651]) +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#6312])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1158])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#653]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#5624])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#870])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#4227]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-8/igt@kms_vrr@flipline.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1091] / [Intel XE#2849])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1123])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#5626])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4837]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#6321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-null-defer-bind:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#3876])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_basic@many-null-defer-bind.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_basic@many-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#288]) +8 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         [PASS][65] -> [FAIL][66] ([Intel XE#6325])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][67] -> [WARN][68] ([Intel XE#5786])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@twice-malloc-fork-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4915]) +115 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_system_allocator@twice-malloc-fork-read.html

  * igt@xe_exec_threads@threads-cm-rebind:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#5625]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_threads@threads-cm-rebind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_threads@threads-cm-rebind.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3573]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1173]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@xe_pm@s2idle-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [PASS][76] -> [TIMEOUT][77] ([Intel XE#3876])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#579])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#5545]) +1 other test dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4650])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#944])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4130])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_vm@shared-pde-page:
    - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#3876]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@shared-pde-page.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm@shared-pde-page.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][86] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#3862]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][90] ([Intel XE#2291]) -> [PASS][91] +4 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][92] ([Intel XE#4354]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][94] ([Intel XE#2316]) -> [PASS][95] +6 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#2049]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#4543]) -> [PASS][99] +6 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][100] ([Intel XE#301]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][102] ([Intel XE#1874]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][104] ([Intel XE#4543]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][106] ([Intel XE#1503]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][108] ([Intel XE#4596]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][110] ([Intel XE#6321]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][113] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][114] ([Intel XE#2341]) -> [FAIL][115] ([Intel XE#1178])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#2049]) -> [INCOMPLETE][117] ([Intel XE#2049] / [Intel XE#4842])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][118] ([Intel XE#301]) -> [FAIL][119] ([Intel XE#301] / [Intel XE#3149])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][120] ([Intel XE#2312]) -> [SKIP][121] ([Intel XE#2311]) +13 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][122] ([Intel XE#2312]) -> [SKIP][123] ([Intel XE#5390]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][124] ([Intel XE#5390]) -> [SKIP][125] ([Intel XE#2312]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][126] ([Intel XE#2311]) -> [SKIP][127] ([Intel XE#2312]) +12 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][128] ([Intel XE#2312]) -> [SKIP][129] ([Intel XE#2313]) +13 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][130] ([Intel XE#2313]) -> [SKIP][131] ([Intel XE#2312]) +12 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#362]) -> [SKIP][133] ([Intel XE#1500])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][134] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][135] ([Intel XE#5530])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -> xe-pw-155865v7

  IGT_8594: 8594
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
  xe-pw-155865v7: 155865v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/index.html

--===============9214541060987950408==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Minor fixes to post-migration rec=
overy (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155865/">https://patchwork.freedesktop.org/series/155865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155865v7/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155865v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c=
5050687_FULL -&gt; xe-pw-155865v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155865v7_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155865v7_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1558=
65v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@xe_exe=
c_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-4=
36/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">ABORT<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-front.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm=
@munmap-style-unbind-userptr-inval-front.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_reset@cm-gt-reset:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_=
reset@cm-gt-reset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6325">Intel XE#6325</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@xe_exec_reset=
@cm-gt-reset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155865v7_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168=
">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-=
storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank=
-interruptible@d-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-3/igt@kms_flip@=
flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-1/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb=
8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-1/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-6/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_plane_lowres@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-8/igt@kms_vrr@=
flipline.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_vrr@flipline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-4/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec=
_basic@many-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_basic@ma=
ny-null-defer-bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec=
_reset@cm-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6325">Intel XE#6325</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-fork-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_system_allocator@tw=
ice-malloc-fork-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec=
_threads@threads-cm-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_threads@t=
hreads-cm-rebind.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5625">Intel XE#5625</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_oa@privileged-forked-acc=
ess-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@xe_pm@s2idle-basic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/295=
3">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm@s=
2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm@s2idle-exec-after.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_pmu@fn-engine-activity-l=
oad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
fair-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde-page:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@s=
hared-pde-page.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm@shared-pde-page.html">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3876">Intel XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/s=
hard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_fl=
ip@absolute-wf_vblank-interruptible@b-hdmi-a6.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1558=
65v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_fli=
p@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/sh=
ard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a>=
 +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shar=
d-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1558=
65v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155865v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a=
-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shar=
d-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_fl=
ip@absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard=
-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Inte=
l XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55865v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7=
/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/sha=
rd-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Int=
el XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155865v7/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct=
_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -&gt; xe-pw-155=
865v7</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c333=
7a72ccbf9c5050687<br />
  xe-pw-155865v7: 155865v7</p>

</body>
</html>

--===============9214541060987950408==--
