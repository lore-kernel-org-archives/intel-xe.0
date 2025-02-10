Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC9C0219E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 11:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FD310E192;
	Mon, 10 Feb 2025 11:15:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7602510E192;
 Mon, 10 Feb 2025 11:15:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4605440326779072578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleaning_up_code_related_t?=
 =?utf-8?q?o_VRAM_regions_and_its_initialization_-_part_1_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 11:15:32 -0000
Message-ID: <173918613247.246715.15160991922341005679@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250210081511.906452-1-piotr.piorkowski@intel.com>
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

--===============4605440326779072578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleaning up code related to VRAM regions and its initialization - part 1 (rev3)
URL   : https://patchwork.freedesktop.org/series/144172/
State : failure

== Summary ==

CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -> xe-pw-144172v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144172v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144172v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144172v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_vm@munmap-style-unbind-one-partial.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1033]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  
New tests
---------

  New tests have been introduced between xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full and xe-pw-144172v3_full:

### New IGT tests (1) ###

  * igt@kms_properties@crtc-properties-legacy@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  

Known issues
------------

  Here are the changes found in xe-pw-144172v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4173]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +29 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1178]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#309]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#310]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#301]) +4 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#3321])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][22] ([Intel XE#1033]) +2 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2316]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#656]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1033]) +4 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#656])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#653])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#870])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1439] / [Intel XE#836])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#836])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1489])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#455])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][39] ([Intel XE#4172]) +2 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2905]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4172])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#1192]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1033] / [Intel XE#569])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     NOTRUN -> [ABORT][47] ([Intel XE#4268])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][48] ([Intel XE#3908]) -> [PASS][49] +3 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [FAIL][50] ([Intel XE#1454]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][52] ([Intel XE#1033]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][54] ([Intel XE#2191]) -> [PASS][55] +2 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][56] ([Intel XE#4173]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][58] ([Intel XE#1033]) -> [PASS][59] +15 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][60] ([Intel XE#2291]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][62] ([Intel XE#877]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [SKIP][64] ([Intel XE#309]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#2049]) -> [PASS][67] +3 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][68] ([Intel XE#310]) -> [PASS][69] +5 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#301]) -> [PASS][71] +3 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][72] ([Intel XE#3321]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [SKIP][74] ([Intel XE#2316]) -> [PASS][75] +5 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][76] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][78] ([Intel XE#886]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#656]) -> [PASS][81] +9 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256:
    - shard-bmg:          [INCOMPLETE][84] ([Intel XE#3966]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#836]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][88] ([Intel XE#1435]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][90] ([Intel XE#899]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          [DMESG-WARN][92] ([Intel XE#4172]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#787]) -> [SKIP][95] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][97] ([Intel XE#787]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][98] ([Intel XE#1178]) -> [SKIP][99] ([Intel XE#455])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_content_protection@atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][100] ([Intel XE#1178]) -> [SKIP][101] ([Intel XE#2341])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_content_protection@legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#455]) -> [FAIL][103] ([Intel XE#1178]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_content_protection@legacy.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1033]) -> [SKIP][105] ([Intel XE#309])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#309]) -> [DMESG-WARN][107] ([Intel XE#1033]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#310]) -> [FAIL][109] ([Intel XE#301])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1033]) -> [SKIP][111] ([Intel XE#310])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#310]) -> [DMESG-WARN][113] ([Intel XE#1033])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [DMESG-FAIL][114] ([Intel XE#4172]) -> [DMESG-WARN][115] ([Intel XE#4172])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#656]) -> [SKIP][117] ([Intel XE#651]) +16 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][118] ([Intel XE#2312]) -> [SKIP][119] ([Intel XE#4141]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#1033]) -> [SKIP][121] ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][122] ([Intel XE#4141]) -> [SKIP][123] ([Intel XE#2312]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][124] ([Intel XE#2312]) -> [SKIP][125] ([Intel XE#2311]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][126] ([Intel XE#2311]) -> [SKIP][127] ([Intel XE#2312]) +14 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#651]) -> [SKIP][129] ([Intel XE#656]) +14 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][130] ([Intel XE#2313]) -> [SKIP][131] ([Intel XE#2312]) +15 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][132] ([Intel XE#2312]) -> [SKIP][133] ([Intel XE#2313]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#653]) -> [SKIP][135] ([Intel XE#656]) +15 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#656]) -> [SKIP][137] ([Intel XE#653]) +16 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][138] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][139] ([Intel XE#3544])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [ABORT][140] ([Intel XE#1033]) -> [ABORT][141] ([Intel XE#4268])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_pm@s4-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_pm@s4-basic.html
    - shard-bmg:          [ABORT][142] ([Intel XE#4172]) -> [ABORT][143] ([Intel XE#4172] / [Intel XE#4268])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_pm@s4-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_pm@s4-basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe -> xe-pw-144172v3

  IGT_8227: 8227
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe
  xe-pw-144172v3: 144172v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/index.html

--===============4605440326779072578==
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
<tr><td><b>Series:</b></td><td>Cleaning up code related to VRAM regions and its initialization - part 1 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144172/">https://patchwork.freedesktop.org/series/144172/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -&gt; xe-pw-144172v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144172v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144172v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144172v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-one-partial:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_vm@munmap-style-unbind-one-partial.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full and xe-pw-144172v3_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_properties@crtc-properties-legacy@pipe-b-hdmi-a-6:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144172v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454">Intel XE#1454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966">Intel XE#3966</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe -&gt; xe-pw-144172v3</li>
</ul>
<p>IGT_8227: 8227<br />
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe<br />
  xe-pw-144172v3: 144172v3</p>

</body>
</html>

--===============4605440326779072578==--
