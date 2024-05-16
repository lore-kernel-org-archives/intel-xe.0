Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBFC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 13:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D919B10ED1C;
	Thu, 16 May 2024 13:29:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1710ED19;
 Thu, 16 May 2024 13:29:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0743068924019421495=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_support_for_VF_to_query_its?=
 =?utf-8?q?_configuration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 13:29:03 -0000
Message-ID: <171586614375.2121816.17153044910516553725@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240516110546.2216-1-michal.wajdeczko@intel.com>
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

--===============0743068924019421495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for VF to query its configuration (rev2)
URL   : https://patchwork.freedesktop.org/series/133509/
State : failure

== Summary ==

CI Bug Log - changes from xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab_full -> xe-pw-133509v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133509v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133509v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133509v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][4] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][6] ([Intel XE#1201]) -> [SKIP][7] +40 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@ctm-signed:
    - {shard-lnl}:        [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-1/igt@kms_color@ctm-signed.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-1/igt@kms_color@ctm-signed.html

  
Known issues
------------

  Here are the changes found in xe-pw-133509v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#619])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#1252])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#307])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#309])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@single-bo@pipe-a:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#282])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195]) +5 other tests incomplete
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip@absolute-wf_vblank@d-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip@absolute-wf_vblank@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][37] ([Intel XE#1191] / [Intel XE#1214]) +6 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#870])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#1174])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#330])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1447])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1126] / [Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1214] / [Intel XE#1238])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1081])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_intel_bb@add-remove-objects:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][54] ([Intel XE#1330] / [Intel XE#1638] / [Intel XE#1760])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_intel_bb@add-remove-objects.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][55] -> [SKIP][56] ([Intel XE#1192] / [Intel XE#1201])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#378])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_module_load@force-load.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s2idle-basic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#1608])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
    - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#1195] / [Intel XE#1358])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#1214]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#1358])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s4-exec-after.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][67] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#1214]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][75] ([Intel XE#1874]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][77] ([Intel XE#361]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][79] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-dg2-set2:     [TIMEOUT][81] ([Intel XE#1473]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][83] ([Intel XE#1330]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][85] ([Intel XE#1214]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - {shard-lnl}:        [FAIL][87] ([Intel XE#1442]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][89] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760]) -> [INCOMPLETE][90] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1538] / [Intel XE#1717] / [Intel XE#1760])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [i915#6077]) -> [SKIP][92] ([i915#6077])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_addfb_basic@bad-pitch-0.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#316]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#316])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][96] ([Intel XE#316]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][97] ([Intel XE#1231]) -> [DMESG-FAIL][98] ([Intel XE#324]) +1 other test dmesg-fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][100] ([Intel XE#829]) +11 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1124]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1124]) -> [SKIP][104] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#367]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][108] ([Intel XE#367]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#787]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][112] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][114] ([Intel XE#787]) +34 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#314]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][120] ([Intel XE#1152]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][122] ([Intel XE#373]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#373]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][125] ([Intel XE#1178]) -> [INCOMPLETE][126] ([Intel XE#1195]) +1 other test incomplete
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#308]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#308])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][130] ([Intel XE#308])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#282]) -> [DMESG-WARN][132] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][134] ([Intel XE#1234])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#282]) -> [DMESG-WARN][136] ([Intel XE#1214] / [Intel XE#282])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#323]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#323])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][140] ([Intel XE#282]) +2 other tests dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#455]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][145] -> [SKIP][146] ([Intel XE#1201])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([i915#3804]) -> [SKIP][148] ([Intel XE#1201] / [i915#3804])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][150] ([Intel XE#1162]) +3 other tests dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][152] ([Intel XE#651]) +9 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#651]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][156] ([Intel XE#653]) +13 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#653]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#687]) -> [SKIP][160] ([Intel XE#687]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_getfb@getfb-handle-closed.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#1162]) -> [DMESG-WARN][162] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][164] ([Intel XE#870])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#870]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#870])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1122]) -> [SKIP][168] ([Intel XE#1122] / [Intel XE#1201])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][170] ([Intel XE#908])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][171] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][172] ([Intel XE#1201])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_prop_blob@invalid-set-prop-any:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#780]) -> [SKIP][174] ([Intel XE#780])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_prop_blob@invalid-set-prop-any.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_prop_blob@invalid-set-prop-any.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1122])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#929]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][180] ([Intel XE#929]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#327]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#327])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][184] ([Intel XE#1034] / [Intel XE#1195])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][186] ([Intel XE#1034] / [Intel XE#1195])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][188] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][190] ([Intel XE#1214] / [Intel XE#1608])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][192] ([Intel XE#455]) +9 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_vrr@flip-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][194] ([Intel XE#1091])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][200] ([Intel XE#1123])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1126]) -> [SKIP][202] ([Intel XE#1126] / [Intel XE#1201])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][204] ([Intel XE#1473] / [Intel XE#392])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-adlp:         [ABORT][205] -> [DMESG-WARN][206] ([Intel XE#1214] / [Intel XE#1330])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][208] ([Intel XE#288]) +15 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#288]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-imm.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][211] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][212] ([Intel XE#1191] / [Intel XE#1214])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1192] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1192])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#512]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#512])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_mmap@small-bar.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [INCOMPLETE][217] ([Intel XE#1195]) -> [DMESG-WARN][218] ([Intel XE#1214])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][220] ([Intel XE#1195])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][221] ([Intel XE#1358]) -> [DMESG-WARN][222] ([Intel XE#1214])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#579]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#579])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1606
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1818
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
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
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab -> xe-pw-133509v2

  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599203ac3e1e3d349bab
  xe-pw-133509v2: 133509v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/index.html

--===============0743068924019421495==
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
<tr><td><b>Series:</b></td><td>Add support for VF to query its configuratio=
n (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/133509/">https://patchwork.freedesktop.org/series/133509/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-133509v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-133509v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1300-3b6a503228b84c010794599203ac3e1e3=
d349bab_full -&gt; xe-pw-133509v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133509v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-133509v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1335=
09v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic-transitions.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-s=
uspend@c-dp4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg=
2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1335=
09v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_color@ctm-signed:<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-1/igt@kms_colo=
r@ctm-signed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-133509v2/shard-lnl-1/igt@kms_color@ctm-signed.html">INCOM=
PLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133509v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_bw@linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-ti=
led-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-sto=
rm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-=
movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-434/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cu=
rsor_legacy@single-bo@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_leg=
acy@single-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +5 =
other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-ch=
eck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_fli=
p@absolute-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip@abso=
lute-wf_vblank@d-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-133509v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_plane@plane-panning-bott=
om-right-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_psr@fbc-pr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_sysfs_edid_timing.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
74">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_evict@evict-beng-small-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@xe_exe=
c_threads@threads-bal-mixed-userptr.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_exec=
_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1=
238</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/=
igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE=
#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@add-remove-objects:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_intel_bb@add-remove-objec=
ts.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1330">Intel XE#1330</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_live=
_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/104=
4">Intel XE#1044</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exe=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@=
s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_pm@s2idle-d3hot-=
basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_async_flips@async-fli=
p-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Inte=
l XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-133509v2/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-leg=
acy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-d=
g2-435/igt@kms_flip@2x-flip-vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shar=
d-dg2-435/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1335=
09v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/sh=
ard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@xe_evi=
ct@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/sha=
rd-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@xe_evi=
ct@evict-mixed-threads-large-multi-vm.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-=
dg2-432/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-3/igt@xe_exec_=
compute_mode@many-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE=
#1330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-133509v2/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-i=
nvalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_=
pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-5/igt@xe_pm_re=
sidency@gt-c6-freeze.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1442">Intel XE#1442</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-3/igt@xe_pm_resi=
dency@gt-c6-freeze.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@core_ho=
tunplug@hotreplug-lateclose.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE=
#1717</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1760">Intel XE#1760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-133509v2/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">In=
tel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_ad=
dfb_basic@bad-pitch-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-4=
32/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_bi=
g_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms=
_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_bi=
g_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg=
2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1335=
09v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async=
-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shar=
d-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#=
1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
133509v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_bw=
@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-46=
3/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Int=
el XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509=
v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">In=
tel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509=
v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">I=
ntel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-133509v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-c=
cs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cd=
clk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt=
@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cd=
clk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/sha=
rd-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_ch=
amelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509=
v2/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">In=
tel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ch=
amelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_ch=
amelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@kms_co=
ntent_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-4=
33/igt@kms_content_protection@atomic@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1=
195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@=
kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13350=
9v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"=
>Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/s=
hard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Int=
el XE#1234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-=
transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cu=
rsor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">I=
ntel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-t=
ransitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/=
shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cu=
rsor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509=
v2/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">I=
ntel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_di=
rtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dir=
tyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_di=
rtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-=
dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_di=
rtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shar=
d-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v=
2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Inte=
l XE#1162</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
>Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primsc=
rn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-closed:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_ge=
tfb@getfb-handle-closed.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-4=
32/igt@kms_getfb@getfb-handle-closed.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-4=
36/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">In=
tel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2=
-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@km=
s_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_=
pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_=
pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_pm_=
rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shar=
d-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_pr=
op_blob@invalid-set-prop-any.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-=
dg2-432/igt@kms_prop_blob@invalid-set-prop-any.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg=
2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_psr@psr-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-=
432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2=
-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
7">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608=
">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1034">Intel XE#1034</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1=
191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
14">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-susp=
end@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2=
/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel =
XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe=
-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_v=
rr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/sh=
ard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#109=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
33509v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Inte=
l XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/s=
hard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/sh=
ard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#112=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_evi=
ct@evict-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#=
392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
33509v2/shard-dg2-432/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Inte=
l XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_exec=
_balancer@no-exec-parallel-userptr-rebind.html">ABORT</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@x=
e_exec_balancer@no-exec-parallel-userptr-rebind.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#12=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/133=
0">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1335=
09v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
8">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_exe=
c_fault_mode@once-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@x=
e_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_gt_f=
req@freq_suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp=
-4/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_liv=
e_ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt=
@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s=
2idle-mocs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_pm@s2idle-=
mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s=
2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard=
-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s4-d=
3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab -&gt; xe-pw-133=
509v2</li>
</ul>
<p>IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599=
203ac3e1e3d349bab<br />
  xe-pw-133509v2: 133509v2</p>

</body>
</html>

--===============0743068924019421495==--
