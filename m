Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFBAC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 08:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56CB10E4C3;
	Mon, 10 Feb 2025 08:22:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246BC10E068;
 Mon, 10 Feb 2025 08:22:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6824550332948283540=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/hdcp=3A_Create_fo?=
 =?utf-8?q?rce=5Fhdcp14_debug_fs_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 08:22:18 -0000
Message-ID: <173917573813.181566.8116117589640894329@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207061454.3030060-1-suraj.kandpal@intel.com>
In-Reply-To: <20250207061454.3030060-1-suraj.kandpal@intel.com>
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

--===============6824550332948283540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Create force_hdcp14 debug fs entry
URL   : https://patchwork.freedesktop.org/series/144460/
State : failure

== Summary ==

CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -> xe-pw-144460v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144460v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144460v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144460v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-144460v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2613])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][5] ([Intel XE#2613])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#787]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1727] / [Intel XE#3113])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3124] / [Intel XE#4010])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#1178])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2291]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#309]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#3009])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_dp_aux_dev.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#3321])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#301]) +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2316]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][28] -> [FAIL][29] ([Intel XE#2882]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#3321]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#2953]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#656]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#651])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#653])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1033]) +4 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6.html

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][40] ([Intel XE#3966])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#870])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1489])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#771] / [Intel XE#899])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#899])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][47] ([Intel XE#4172]) +2 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2905])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-bmg:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4172]) +11 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#4173]) +4 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][53] ([Intel XE#3908]) -> [PASS][54] +3 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [FAIL][55] ([Intel XE#1454]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][57] ([Intel XE#1033]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][59] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#2191]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][63] ([Intel XE#4172]) -> [PASS][64] +14 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][65] ([Intel XE#4173]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][67] ([Intel XE#2291]) -> [PASS][68] +3 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][69] ([Intel XE#1340]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][71] ([Intel XE#2373]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#702]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][75] ([Intel XE#2049]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][77] ([Intel XE#3321]) -> [PASS][78] +3 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][79] ([Intel XE#1033]) -> [PASS][80] +10 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][81] ([Intel XE#2316]) -> [PASS][82] +8 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#310]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][85] ([Intel XE#301]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][87] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][89] ([Intel XE#886]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [FAIL][91] ([Intel XE#2882]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#656]) -> [PASS][94] +3 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256:
    - shard-bmg:          [INCOMPLETE][95] ([Intel XE#3966]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][97] ([Intel XE#2571]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#309]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][101] ([Intel XE#1435]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][103] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][106] ([Intel XE#787]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#787]) -> [SKIP][108] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][109] ([Intel XE#1178]) -> [SKIP][110] ([Intel XE#2341])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_content_protection@atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#455]) -> [FAIL][112] ([Intel XE#1178])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_content_protection@srm.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#1188]) -> [SKIP][114] ([Intel XE#455])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_content_protection@uevent.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#877]) -> [SKIP][116] ([Intel XE#2291])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#310]) -> [FAIL][118] ([Intel XE#301])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][119] ([Intel XE#2316]) -> [FAIL][120] ([Intel XE#3321])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][121] ([Intel XE#301]) -> [SKIP][122] ([Intel XE#310])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [DMESG-FAIL][123] ([Intel XE#4172]) -> [DMESG-WARN][124] ([Intel XE#4172])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2312]) -> [SKIP][126] ([Intel XE#2311]) +22 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#656]) -> [SKIP][128] ([Intel XE#651]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#4141]) +9 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][131] ([Intel XE#4141]) -> [SKIP][132] ([Intel XE#2312]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#651]) -> [SKIP][134] ([Intel XE#656]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#2312]) +13 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][137] ([Intel XE#2312]) -> [SKIP][138] ([Intel XE#2313]) +18 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#656]) -> [SKIP][140] ([Intel XE#653]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][141] ([Intel XE#2313]) -> [SKIP][142] ([Intel XE#2312]) +15 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#653]) -> [SKIP][144] ([Intel XE#656]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][145] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][146] ([Intel XE#3544])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [ABORT][147] ([Intel XE#1033]) -> [ABORT][148] ([Intel XE#1033] / [Intel XE#4268])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_pm@s4-basic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@xe_pm@s4-basic.html
    - shard-bmg:          [ABORT][149] ([Intel XE#4172]) -> [ABORT][150] ([Intel XE#4172] / [Intel XE#4268])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_pm@s4-basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][151] ([Intel XE#4268]) -> [ABORT][152] ([Intel XE#4054] / [Intel XE#4268])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe -> xe-pw-144460v1

  IGT_8227: 8227
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe
  xe-pw-144460v1: 144460v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/index.html

--===============6824550332948283540==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Create force_hdcp14 debug fs entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144460/">https://patchwork.freedesktop.org/series/144460/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -&gt; xe-pw-144460v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144460v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144460v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144460v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144460v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966">Intel XE#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454">Intel XE#1454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966">Intel XE#3966</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-dg2-464/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-bmg-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144460v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054">Intel XE#4054</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe -&gt; xe-pw-144460v1</li>
</ul>
<p>IGT_8227: 8227<br />
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe<br />
  xe-pw-144460v1: 144460v1</p>

</body>
</html>

--===============6824550332948283540==--
