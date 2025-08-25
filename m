Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122DC8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5829F10E359;
	Mon, 25 Aug 2025 18:43:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848E10E359;
 Mon, 25 Aug 2025 18:43:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5283219553197686514=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/vf=3A_Enable_CCS_sa?=
 =?utf-8?q?ve/restore_only_on_supported_GUC_versions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 18:43:49 -0000
Message-ID: <175614742902.268230.3030175311943108089@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
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

--===============5283219553197686514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Enable CCS save/restore only on supported GUC versions (rev3)
URL   : https://patchwork.freedesktop.org/series/153061/
State : success

== Summary ==

CI Bug Log - changes from xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695_FULL -> xe-pw-153061v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153061v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_atomic_transition@modeset-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#4543]) +2 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +160 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#787]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1178])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2291]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#1475])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2316]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#4543]) +7 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#5338]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][24] -> [INCOMPLETE][25] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#1874]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#653])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#656])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1503]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr@psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#2939] / [Intel XE#5585] / [Intel XE#5899])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1392]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][38] -> [ABORT][39] ([Intel XE#5729])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@once-large-mmap-race:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#4915]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@xe_exec_system_allocator@once-large-mmap-race.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][41] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][42] +6 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][43] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][45] ([Intel XE#2291]) -> [PASS][46] +3 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][47] ([Intel XE#2316]) -> [PASS][48] +4 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [DMESG-WARN][49] ([Intel XE#4543]) -> [PASS][50] +2 other tests pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][51] ([Intel XE#4596]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-adlp:         [ABORT][53] ([Intel XE#5545]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][55] ([Intel XE#1439]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#1392]) -> [PASS][58] +8 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][59] ([Intel XE#3876]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][61] ([Intel XE#5786]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [DMESG-WARN][63] ([Intel XE#3876]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [DMESG-FAIL][65] ([Intel XE#3876]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][67] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][68] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][70] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][71] ([Intel XE#1178]) -> [SKIP][72] ([Intel XE#2341])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_content_protection@atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][73] ([Intel XE#2341]) -> [FAIL][74] ([Intel XE#1178])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_content_protection@legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#5208]) -> [DMESG-WARN][76] ([Intel XE#4543] / [Intel XE#5208])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][77] ([Intel XE#2312]) -> [SKIP][78] ([Intel XE#2311]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][79] ([Intel XE#5390]) -> [SKIP][80] ([Intel XE#2312]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][81] ([Intel XE#2312]) -> [SKIP][82] ([Intel XE#5390]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][83] ([Intel XE#2311]) -> [SKIP][84] ([Intel XE#2312]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][85] ([Intel XE#2312]) -> [SKIP][86] ([Intel XE#2313]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][87] ([Intel XE#2313]) -> [SKIP][88] ([Intel XE#2312]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][89] ([Intel XE#1729]) -> [SKIP][90] ([Intel XE#2426])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][91] ([Intel XE#2509]) -> [SKIP][92] ([Intel XE#2426])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][93] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][94] ([Intel XE#5466])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#1173]) -> [SKIP][96] ([Intel XE#1061])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-434/igt@xe_peer2peer@write.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [ABORT][97] ([Intel XE#3970]) -> [DMESG-WARN][98] ([Intel XE#3876])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5729
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -> xe-pw-153061v3

  IGT_8505: 8505
  xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2b89fb2caf55bb0695
  xe-pw-153061v3: 153061v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/index.html

--===============5283219553197686514==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Enable CCS save/restore only on s=
upported GUC versions (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153061/">https://patchwork.freedesktop.org/series/153061/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153061v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153061v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3611-5481954bd63bd4d34a5acb2b89fb2caf5=
5bb0695_FULL -&gt; xe-pw-153061v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153061v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_ato=
mic_transition@modeset-transition.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_atomic=
_transition@modeset-transition.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-a=
dlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_ccs@random-ccs-data-yf-t=
iled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_ccs@random-ccs-data-yf-t=
iled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-8/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_flip@2x-flip-=
vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_flip@basi=
c-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-7/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-4/i=
gt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel =
XE#5338</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp=
-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153061v3/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_psr@psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@xe_ex=
ec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-4/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-9/igt@xe_exec_reset@gt-rese=
t-stress.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5729">Intel XE#5729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@xe_exec_system_allocator@onc=
e-large-mmap-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-3/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">I=
ntel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153061v3/shard-adlp-3/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> +6 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-8/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg=
-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-3/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-3/i=
gt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@kms_pm_=
rpm@basic-pci-d3-state.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/igt@kms_pm=
_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-=
dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-4/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/sh=
ard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-fd-rebind.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg=
2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-1/igt@xe_exec=
_threads@threads-hang-shared-vm-userptr-invalidate-race.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Int=
el XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153061v3/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-user=
ptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153061v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-adlp-1/igt@kms_flip@=
flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
061v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
61v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53061v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153061v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
061v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3061v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-6/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-lnl-1/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153061v3/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-dg2-434/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v3/shard-bmg-4/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>=
)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -&gt; xe-pw-153=
061v3</li>
</ul>
<p>IGT_8505: 8505<br />
  xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2=
b89fb2caf55bb0695<br />
  xe-pw-153061v3: 153061v3</p>

</body>
</html>

--===============5283219553197686514==--
