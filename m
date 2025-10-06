Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA566CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE03810E30C;
	Mon,  6 Oct 2025 11:35:33 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56910E30C;
 Mon,  6 Oct 2025 11:35:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0562406928541319015=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/=3A_Mutual_Exclusiv?=
 =?utf-8?q?ity_b/w_Multi_CCS_Mode_=26_SRIOV_VF_Provisioning_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 11:35:32 -0000
Message-ID: <175975053224.8032.14584854095594708873@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006084542.1302116-2-naresh.kumar.g@intel.com>
In-Reply-To: <20251006084542.1302116-2-naresh.kumar.g@intel.com>
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

--===============0562406928541319015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF Provisioning (rev4)
URL   : https://patchwork.freedesktop.org/series/154538/
State : failure

== Summary ==

CI Bug Log - changes from xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47_FULL -> xe-pw-154538v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154538v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154538v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154538v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  
Known issues
------------

  Here are the changes found in xe-pw-154538v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#787]) +139 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#3862]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#3862]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#1178]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#5299])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#4294])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2316]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#4543] / [Intel XE#5208])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#4543]) +8 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][30] -> [DMESG-FAIL][31] ([Intel XE#4543]) +1 other test dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#651]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#653]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#616])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#870])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#3414])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1435])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#5890]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1126])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#5626]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4837])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1392]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#288]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#4915]) +53 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#5893])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#3573])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1173]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#4819]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#944])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#3342])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@small-bo:
    - shard-adlp:         [DMESG-WARN][60] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_addfb_basic@small-bo.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@kms_addfb_basic@small-bo.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][62] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][66] ([Intel XE#2291]) -> [PASS][67] +3 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][68] ([Intel XE#2316]) -> [PASS][69] +3 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#4543]) -> [PASS][71] +10 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][72] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][74] ([Intel XE#301]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][76] ([Intel XE#2571]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [FAIL][78] ([Intel XE#5794]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [FAIL][80] ([Intel XE#5963]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * {igt@xe_configfs@ctx-restore-mid-bb-invalid}:
    - shard-dg2-set2:     [ABORT][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-435/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1392]) -> [PASS][85] +5 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][86] ([Intel XE#6050]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - shard-bmg:          [DMESG-FAIL][88] ([Intel XE#5213]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_system_allocator@twice-malloc-nomemset.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-5/igt@xe_exec_system_allocator@twice-malloc-nomemset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [SKIP][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_pm@s2idle-basic.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][143] ([Intel XE#4543]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][144] ([Intel XE#2311]) -> [SKIP][145] ([Intel XE#2312]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][146] ([Intel XE#5390]) -> [SKIP][147] ([Intel XE#2312]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][148] ([Intel XE#2312]) -> [SKIP][149] ([Intel XE#5390]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][150] ([Intel XE#2312]) -> [SKIP][151] ([Intel XE#2311]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#2313]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][154] ([Intel XE#2313]) -> [SKIP][155] ([Intel XE#2312]) +10 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][156] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][157] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47 -> xe-pw-154538v4

  IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47: 0ce21448d1c984adf76d9dbfb3ad626ef8f33e47
  xe-pw-154538v4: 154538v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/index.html

--===============0562406928541319015==
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
<tr><td><b>Series:</b></td><td>drm/xe/: Mutual Exclusivity b/w Multi CCS Mo=
de &amp; SRIOV VF Provisioning (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154538/">https://patchwork.freedesktop.org/series/154538/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154538v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154538v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef=
8f33e47_FULL -&gt; xe-pw-154538v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154538v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154538v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1545=
38v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_rotation_crc@multiplane-rotation-cropping-top:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@kms_ro=
tation_crc@multiplane-rotation-cropping-top.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt=
@kms_rotation_crc@multiplane-rotation-cropping-top.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154538v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_big=
_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@kms_big_fb@linear=
-8bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other =
test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-464/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-8/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +8 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@kms_flip_tiling@=
flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-435/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_eudebug_online@pagefault=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_exec_system_allocator@pr=
ocess-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +53 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-4=
35/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-154538v4/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_query@multigpu-query-inv=
alid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_add=
fb_basic@small-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adl=
p-9/igt@kms_addfb_basic@small-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-436/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-3/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@kms=
_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp=
-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +10 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1545=
38v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shar=
d-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-3/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@xe_compu=
te@ccs-mode-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5794">Intel XE#5794</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-8/igt@xe_compute@cc=
s-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@xe_compu=
te@ccs-mode-compute-kernel.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5963">Intel XE#5963</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-bmg-1/igt@xe_c=
ompute@ccs-mode-compute-kernel.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_configfs@ctx-restore-mid-bb-invalid}:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_con=
figfs@ctx-restore-mid-bb-invalid.html">ABORT</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg2-435/igt@xe_config=
fs@ctx-restore-mid-bb-invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-dg=
2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_=
fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050">Intel =
XE#6050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154538v4/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-=
invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_=
system_allocator@twice-malloc-nomemset.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/sh=
ard-bmg-5/igt@xe_exec_system_allocator@twice-malloc-nomemset.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e4=
7/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8=
f33e47/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad6=
26ef8f33e47/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbf=
b3ad626ef8f33e47/shard-adlp-8/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76=
d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984=
adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d=
1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce2=
1448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867=
-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e4=
7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8=
f33e47/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad6=
26ef8f33e47/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbf=
b3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76=
d9dbfb3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984=
adf76d9dbfb3ad626ef8f33e47/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v=
4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4538v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154538v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard=
-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154538v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154538v4/shard-adlp-6/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/=
shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-154538v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1545=
38v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-154538v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154538v4/shard-adlp-8/igt@xe_module_load@load=
.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_pm@s=
2idle-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/s=
hard-adlp-9/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4=
/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1545=
38v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4538v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154538v4/=
shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
538v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Inte=
l XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-154538v4/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47 -&gt; xe-pw-154=
538v4</li>
</ul>
<p>IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47: 0ce21448d1c984adf76d9db=
fb3ad626ef8f33e47<br />
  xe-pw-154538v4: 154538v4</p>

</body>
</html>

--===============0562406928541319015==--
