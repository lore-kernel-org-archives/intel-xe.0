Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBCCCCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 05:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311FE10E17C;
	Sat, 25 Oct 2025 05:03:53 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEE010E17C;
 Sat, 25 Oct 2025 05:03:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8335510862648495123=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_serialization_on_burst?=
 =?utf-8?q?_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Oct 2025 05:03:51 -0000
Message-ID: <176136863176.54487.12375150204576555024@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024152323.1281242-1-matthew.brost@intel.com>
In-Reply-To: <20251024152323.1281242-1-matthew.brost@intel.com>
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

--===============8335510862648495123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix serialization on burst of unbinds - v2
URL   : https://patchwork.freedesktop.org/series/156486/
State : failure

== Summary ==

CI Bug Log - changes from xe-3982-60a51825a1d699df170dfa797b099112e3a02de4_FULL -> xe-pw-156486v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156486v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156486v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156486v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +24 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +24 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-156486v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@core_hotunplug@hotrebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@core_hotunplug@hotrebind.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2191])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +20 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +2 other tests incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#6168])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1727] / [Intel XE#3113])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#373]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#373]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#1178]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#323])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#4422])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#4543] / [Intel XE#5208])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +2 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-8/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-adlp:         [PASS][34] -> [ABORT][35] ([Intel XE#2953])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_force_connector_basic@force-connector-state.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#651]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#6312])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#656])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#653]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1122])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#3414])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#5300])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#5626])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4837]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1392] / [Intel XE#5575])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#288]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_system_allocator@madvise-multi-vma:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#4915]) +18 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_exec_system_allocator@madvise-multi-vma.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4915]) +110 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_oa@oa-exponents:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#3573])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#3573]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#2284] / [Intel XE#366])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2284] / [Intel XE#366])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2953] / [Intel XE#3088] / [Intel XE#4173]) +1 other test dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4650])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4733])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#944]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4351])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-adlp:         [DMESG-WARN][63] ([Intel XE#4543]) -> [PASS][64] +2 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][65] ([Intel XE#4543]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#455]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [FAIL][71] ([Intel XE#6407]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@xe_gt_freq@freq_fixed_idle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-436/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][73], [PASS][74], [SKIP][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98]) ([Intel XE#378]) -> ([PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-4/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-5/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-5/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-4/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-4/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [SKIP][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149]) ([Intel XE#2457]) -> ([PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-3/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-7/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-7/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-4/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-3/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-3/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-5/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-8/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-5/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [INCOMPLETE][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [ABORT][177] ([Intel XE#4917]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#4543]) -> [DMESG-WARN][180] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][183] ([Intel XE#1178]) -> [SKIP][184] ([Intel XE#455])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_content_protection@legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-435/igt@kms_content_protection@legacy.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][185] ([Intel XE#734]) -> [FAIL][186] ([Intel XE#3325])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#362]) -> [FAIL][188] ([Intel XE#1729])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#362]) -> [SKIP][190] ([Intel XE#1500])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1392]) -> [INCOMPLETE][192] ([Intel XE#4842])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][193] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][194] ([Intel XE#5530])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3982-60a51825a1d699df170dfa797b099112e3a02de4 -> xe-pw-156486v1

  IGT_8596: 8596
  xe-3982-60a51825a1d699df170dfa797b099112e3a02de4: 60a51825a1d699df170dfa797b099112e3a02de4
  xe-pw-156486v1: 156486v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/index.html

--===============8335510862648495123==
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
<tr><td><b>Series:</b></td><td>Fix serialization on burst of unbinds - v2</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156486/">https://patchwork.freedesktop.org/series/156486/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-156486v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3982-60a51825a1d699df170dfa797b099112e=
3a02de4_FULL -&gt; xe-pw-156486v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156486v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-156486v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1564=
86v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-malloc-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/i=
gt@xe_exec_system_allocator@process-many-large-malloc-race.html">ABORT</a> =
+24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomemset:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-new-race-nomemset.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/sha=
rd-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-new-race-nomem=
set.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156486v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@core_ho=
tunplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@core_hotunplug@hotrebind.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-3/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/s=
hard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adl=
p-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) +2 o=
ther tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">IN=
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
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168=
">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg=
2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_chamelium_audio@hdmi-aud=
io.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_content_protection@atom=
ic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-156486v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-8/igt@kms_flip@pla=
in-flip-ts-check@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_for=
ce_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms=
_force_connector_basic@force-connector-state.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@kms_psr@fbc-psr-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_copy_basic@mem-page-copy-=
17.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_eu_stall@non-blocking-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-ex=
ec-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-multi-vma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_exec_system_allocator@mad=
vise-multi-vma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4915">Intel XE#4915</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_oa@oa-exponents.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-3/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-2/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156486v1/shard-dg2-464/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-1/igt@kms=
_flip@basic-flip-vs-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-4/=
igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-466/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_pm_=
rpm@modeset-lpsp-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/sha=
rd-adlp-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@xe_gt_=
freq@freq_fixed_idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6407">Intel XE#6407</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-436/igt@xe_gt_fr=
eq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a0=
2de4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112=
e3a02de4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b09=
9112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa79=
7b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170d=
fa797b099112e3a02de4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df=
170dfa797b099112e3a02de4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d6=
99df170dfa797b099112e3a02de4/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825=
a1d699df170dfa797b099112e3a02de4/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a5=
1825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-=
60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de=
4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156486v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156486v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156486v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156486v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a0=
2de4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112=
e3a02de4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b09=
9112e3a02de4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa79=
7b099112e3a02de4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170d=
fa797b099112e3a02de4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df=
170dfa797b099112e3a02de4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d6=
99df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825=
a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a5=
1825a1d699df170dfa797b099112e3a02de4/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-=
60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de=
4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56486v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56486v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56486v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56486v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56486v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156486v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-prefetch.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-=
prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-8/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#491=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
486v1/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-=
random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-=
adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel =
XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-433/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-435/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-6/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156486v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-433/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/sha=
rd-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/shard-dg2-463/igt@x=
e_exec_basic@multigpu-once-basic.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/shard-adlp-4/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Int=
el XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156486v1/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct=
_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3982-60a51825a1d699df170dfa797b099112e3a02de4 -&gt; xe-pw-156=
486v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3982-60a51825a1d699df170dfa797b099112e3a02de4: 60a51825a1d699df170dfa7=
97b099112e3a02de4<br />
  xe-pw-156486v1: 156486v1</p>

</body>
</html>

--===============8335510862648495123==--
