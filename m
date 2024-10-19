Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E543D3E1AC
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 04:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A344A10E070;
	Sat, 19 Oct 2024 04:55:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693E10E070;
 Sat, 19 Oct 2024 04:55:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3154847638972495854=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/ufence=3A_Signal_ufence_?=
 =?utf-8?q?immediately_when_possible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Oct 2024 04:55:33 -0000
Message-ID: <172931373360.1301784.6814715073320870323@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
In-Reply-To: <20241018124710.1536948-1-nirmoy.das@intel.com>
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

--===============3154847638972495854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ufence: Signal ufence immediately when possible
URL   : https://patchwork.freedesktop.org/series/140169/
State : failure

== Summary ==

CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full -> xe-pw-140169v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140169v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140169v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140169v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@once-rebind:
    - shard-adlp:         [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-3/igt@xe_exec_compute_mode@once-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_compute_mode@once-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +20 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_pat@pat-index-all:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@xe_pat@pat-index-all.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_pat@pat-index-all.html

  
#### Warnings ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][10] ([Intel XE#1130]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - {shard-bmg}:        [SKIP][12] ([Intel XE#3007]) -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][14] +3 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  * igt@xe_exec_compute_mode@twice-basic:
    - {shard-bmg}:        [PASS][15] -> [INCOMPLETE][16] +15 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@xe_exec_compute_mode@twice-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - {shard-bmg}:        [SKIP][17] ([Intel XE#1130]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  
New tests
---------

  New tests have been introduced between xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full and xe-pw-140169v1_full:

### New IGT tests (2) ###

  * igt@xe_exec_fault_mode:
    - Statuses : 4 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_waitfence:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-140169v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1033]) +2 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +20 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#306]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#308])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1137])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#310])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][35] -> [FAIL][36] ([Intel XE#301]) +6 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#651]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#651]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#653]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#656]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2763]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2938])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1489])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#2948]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1126])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][49] -> [INCOMPLETE][50] ([Intel XE#1195] / [Intel XE#1473])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#2594])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@xe_exec_balancer.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][52] ([Intel XE#1195])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#1195])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-userptr.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-rebind:
    - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1195]) +10 other tests incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195]) +13 other tests incomplete
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-8/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode (NEW):
    - {shard-bmg}:        NOTRUN -> ([INCOMPLETE][58], [INCOMPLETE][59], [INCOMPLETE][60], [INCOMPLETE][61]) ([Intel XE#2594])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@xe_exec_fault_mode.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#288]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#288])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
    - shard-adlp:         NOTRUN -> [INCOMPLETE][65] ([Intel XE#1169])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-basic:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1169] / [Intel XE#1356])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_exec_threads@threads-cm-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_threads@threads-cm-basic.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-lnl:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#1169]) +3 other tests incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@xe_exec_threads@threads-cm-userptr.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-7/igt@xe_exec_threads@threads-cm-userptr.html
    - shard-adlp:         [PASS][70] -> [INCOMPLETE][71] ([Intel XE#1169] / [Intel XE#1195]) +3 other tests incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@xe_exec_threads@threads-cm-userptr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-6/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-rebind:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +5 other tests incomplete
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2541])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#1173]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#579])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#944])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][78] -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html
    - {shard-bmg}:        [FAIL][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - {shard-bmg}:        [DMESG-WARN][82] ([Intel XE#877]) -> [PASS][83] +3 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][84] ([Intel XE#1426]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#2423] / [i915#2575]) -> [PASS][87] +3 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][88] ([Intel XE#301]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#301]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][92] ([Intel XE#886]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [ABORT][94] ([Intel XE#2625]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][96] ([Intel XE#718]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1130]) -> [PASS][99] +4 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind:
    - {shard-bmg}:        [SKIP][100] ([Intel XE#1130]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#2890]) -> [SKIP][103] ([Intel XE#316])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#2890]) -> [SKIP][105] ([Intel XE#2907])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#2423] / [i915#2575]) -> [SKIP][107] ([Intel XE#455])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x32.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#2890]) -> [SKIP][109] ([Intel XE#455])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][110] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][111] ([Intel XE#1861])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1130]) -> [SKIP][113] ([Intel XE#288])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1130]) -> [SKIP][115] ([Intel XE#2541])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8078 -> IGT_8080
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-pw-140169v1

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-pw-140169v1: 140169v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html

--===============3154847638972495854==
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
<tr><td><b>Series:</b></td><td>drm/xe/ufence: Signal ufence immediately when possible</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140169/">https://patchwork.freedesktop.org/series/140169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full -&gt; xe-pw-140169v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140169v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140169v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140169v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-3/igt@xe_exec_compute_mode@once-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_compute_mode@once-rebind.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">INCOMPLETE</a> +20 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_pat@pat-index-all.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a> +15 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full and xe-pw-140169v1_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_exec_fault_mode:</p>
<ul>
<li>Statuses : 4 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140169v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-4/igt@xe_exec_balancer.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-9/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +10 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-8/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +13 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@xe_exec_fault_mode.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_fault_mode.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test incomplete</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_exec_threads@threads-cm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@xe_exec_threads@threads-cm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-7/igt@xe_exec_threads@threads-cm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) +3 other tests incomplete</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-6/igt@xe_exec_threads@threads-cm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-bmg-5/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/shard-dg2-466/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8078 -&gt; IGT_8080</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-pw-140169v1</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-pw-140169v1: 140169v1</p>

</body>
</html>

--===============3154847638972495854==--
