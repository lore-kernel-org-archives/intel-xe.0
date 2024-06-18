Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB151C2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 16:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EA310E059;
	Tue, 18 Jun 2024 16:01:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E2810E706;
 Tue, 18 Jun 2024 16:01:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1293775147640577799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_OA_functionality_to_Xe_=28r?=
 =?utf-8?q?ev18=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 16:01:19 -0000
Message-ID: <171872647945.104397.457968813810525497@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

--===============1293775147640577799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add OA functionality to Xe (rev18)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

CI Bug Log - changes from xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153_full -> xe-pw-121084v18_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-121084v18_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-121084v18_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-121084v18_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][1] ([Intel XE#1214]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@blocking-wf_vblank@b-edp1:
    - {shard-lnl}:        NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - {shard-lnl}:        [SKIP][4] ([Intel XE#656]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - {shard-lnl}:        [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [DMESG-WARN][9] ([Intel XE#1620]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html

  
Known issues
------------

  Here are the changes found in xe-pw-121084v18_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1195]) +3 other tests incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][15] ([Intel XE#1874])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1231]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1252])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#308])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][34] ([Intel XE#361]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1129] / [Intel XE#1201])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1211])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@kms_pm_rpm@legacy-planes-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#899])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#899]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1034])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1191] / [Intel XE#1214])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#756])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][52] -> [TIMEOUT][53] ([Intel XE#1473] / [Intel XE#402])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#1975])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@xe_gt_freq@freq_reset_multiple.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][62] ([Intel XE#1191] / [Intel XE#1214])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][63] ([Intel XE#1214])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][64] -> [ABORT][65] ([Intel XE#1358])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_vm@unbind-all-8-vmas:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#1214]) +2 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@unbind-all-8-vmas.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@xe_vm@unbind-all-8-vmas.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][72] +10 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - {shard-lnl}:        [DMESG-WARN][73] -> [PASS][74] +6 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][77] ([Intel XE#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][79] ([Intel XE#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][81] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][83] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - {shard-lnl}:        [FAIL][85] ([Intel XE#1069]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [FAIL][87] ([Intel XE#1414]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_bo:
    - {shard-lnl}:        [SKIP][89] ([Intel XE#1192]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_live_ktest@xe_bo.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - {shard-lnl}:        [FAIL][91] ([Intel XE#958]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#1214]) -> [PASS][94] +6 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#316]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][98] ([Intel XE#316]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][99] ([Intel XE#1231]) -> [DMESG-FAIL][100] ([Intel XE#324])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124]) -> [SKIP][102] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][104] ([Intel XE#607])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][106] ([Intel XE#1124]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1231]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#346]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#346])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][112] ([Intel XE#367])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#367]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#787]) +55 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#787]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][122] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][124] ([Intel XE#314]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1152]) -> [SKIP][126] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#306]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][130] ([Intel XE#306])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][132] ([Intel XE#373]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#373]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#307]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#307])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][138] ([Intel XE#282]) +4 other tests dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-dpms.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#308]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][142] ([Intel XE#308])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#455]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#323]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#323])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][147] ([Intel XE#282]) -> [DMESG-WARN][148] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][150] ([Intel XE#323])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][151] ([i915#3804]) -> [SKIP][152] ([Intel XE#1201] / [i915#3804])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#703]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][156] ([Intel XE#1137])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1135]) -> [SKIP][158] ([Intel XE#1135] / [Intel XE#1201])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][160] ([Intel XE#651]) +23 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#651]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#653]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][166] ([Intel XE#653]) +25 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][168] ([Intel XE#605])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][169] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][170] ([Intel XE#1162])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][172] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][174] ([Intel XE#498]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][176] ([Intel XE#305]) +11 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#305] / [Intel XE#455]) +6 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#870]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][182] ([Intel XE#929]) +15 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#929]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1127])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1500]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#1500])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][190] ([Intel XE#1034] / [Intel XE#1551])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][191] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][192] ([Intel XE#1551])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][194] ([Intel XE#455]) +15 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vrr@flipline.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#756]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#756])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1091]) -> [SKIP][198] ([Intel XE#1091] / [Intel XE#1201])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][200] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][202] ([Intel XE#1123])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][204] ([Intel XE#288]) +20 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#288]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#255]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#255])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][210] ([Intel XE#378])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_module_load@force-load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [DMESG-WARN][211] ([Intel XE#1214]) -> [DMESG-WARN][212] ([Intel XE#1191] / [Intel XE#1214])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_pm@s3-basic-exec.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][214] ([Intel XE#366])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][215] -> [DMESG-WARN][216] ([Intel XE#1214]) +2 other tests dmesg-warn
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][218] ([Intel XE#944]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#944]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][222] ([Intel XE#1214] / [Intel XE#1760])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153 -> xe-pw-121084v18

  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153: 7f26b37f8cb73f5cf2251d7fff5b55240e04f153
  xe-pw-121084v18: 121084v18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/index.html

--===============1293775147640577799==
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
<tr><td><b>Series:</b></td><td>Add OA functionality to Xe (rev18)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121084/">https://patchwork.freedesktop.org/series/121084/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153_full -&gt; xe-pw-121084v18_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-121084v18_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-121084v18_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-121084v18_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-edp1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@b-edp1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121084v18_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975">Intel XE#1975</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_pm@s2idle-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-2/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@unbind-all-8-vmas:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@unbind-all-8-vmas.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@xe_vm@unbind-all-8-vmas.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-5/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-3145728:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-6/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-434/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v18/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153 -&gt; xe-pw-121084v18</li>
</ul>
<p>IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153: 7f26b37f8cb73f5cf2251d7fff5b55240e04f153<br />
  xe-pw-121084v18: 121084v18</p>

</body>
</html>

--===============1293775147640577799==--
