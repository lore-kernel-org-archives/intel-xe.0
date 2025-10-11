Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE03ACCD185
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 00:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE1610E059;
	Sat, 11 Oct 2025 00:11:55 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47D210E059;
 Sat, 11 Oct 2025 00:11:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4186866129981256064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/guc=3A_Check_CT_ena?=
 =?utf-8?q?ble_state_before_deregistering_exec_queue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Oct 2025 00:11:53 -0000
Message-ID: <176014151364.1733.16159041125980765085@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
In-Reply-To: <20251004173033.2511250-2-shuicheng.lin@intel.com>
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

--===============4186866129981256064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Check CT enable state before deregistering exec queue (rev2)
URL   : https://patchwork.freedesktop.org/series/155417/
State : success

== Summary ==

CI Bug Log - changes from xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8_FULL -> xe-pw-155417v2_FULL
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

  Here are the changes found in xe-pw-155417v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][3] -> [FAIL][4] ([Intel XE#3908]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#2191])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#787]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2907])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#3862]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#4418])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#1188]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2291]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#323])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#4354])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#701])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2316]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][28] ([Intel XE#2049]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#301]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +10 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          [PASS][33] -> [INCOMPLETE][34] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#1874]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#651]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#5390])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#653]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#1503])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1129])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1127])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#5626])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#4837]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#288]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4915]) +89 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79]) -> ([PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105]) ([Intel XE#378])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-436/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-433/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-432/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-434/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-436/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-433/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-434/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-432/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-436/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-432/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-433/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-432/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-434/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-432/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-463/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-434/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-434/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-432/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-463/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-466/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-463/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-466/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3573]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][108] -> [DMESG-WARN][109] ([Intel XE#3876])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4733])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#944])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4814]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4351])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][114] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][116] ([Intel XE#3862]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][118] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#6168]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][122] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][124] ([Intel XE#2291]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][126] ([Intel XE#1475]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][128] ([Intel XE#5354]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][130] ([Intel XE#2316]) -> [PASS][131] +9 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][132] ([Intel XE#3098]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][134] ([Intel XE#4543]) -> [PASS][135] +6 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-2/igt@kms_flip@plain-flip-interruptible@d-hdmi-a1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-4/igt@kms_flip@plain-flip-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][136] ([Intel XE#5408] / [Intel XE#5416]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][138] ([Intel XE#1503]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#616]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - shard-adlp:         [DMESG-WARN][144] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][145] +6 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][146] ([Intel XE#2341]) -> [FAIL][147] ([Intel XE#1178])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][148] ([Intel XE#301]) -> [FAIL][149] ([Intel XE#301] / [Intel XE#3149])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [TIMEOUT][150] ([Intel XE#4543]) -> [DMESG-WARN][151] ([Intel XE#4543]) +1 other test dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#2311]) -> [SKIP][153] ([Intel XE#2312]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][154] ([Intel XE#5390]) -> [SKIP][155] ([Intel XE#2312]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#5390]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#2311]) +10 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][160] ([Intel XE#2313]) -> [SKIP][161] ([Intel XE#2312]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#2313]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [ABORT][164] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][165] ([Intel XE#5466])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8 -> xe-pw-155417v2

  IGT_8581: 8581
  xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8: c40150f969a0c5c5c08d7a2092485c008aea8fa8
  xe-pw-155417v2: 155417v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/index.html

--===============4186866129981256064==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Check CT enable state before der=
egistering exec queue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155417/">https://patchwork.freedesktop.org/series/155417/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155417v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155417v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3898-c40150f969a0c5c5c08d7a2092485c008=
aea8fa8_FULL -&gt; xe-pw-155417v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155417v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bm=
g-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-1/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-3/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-t=
iled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_flip@2x=
-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-8/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other tes=
ts dmesg-warn</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp-4/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32=
bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_psr@pr-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">I=
ntel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_eudebug@vma-ufence-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008a=
ea8fa8/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a209248=
5c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7=
a2092485c008aea8fa8/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c=
5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f96=
9a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40=
150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-38=
98-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea=
8fa8/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c=
008aea8fa8/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a20=
92485c008aea8fa8/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c0=
8d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0=
c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150=
f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-=
c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155417v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg=
2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-434/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155417v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-434/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v=
2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-432/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155417v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155417v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155417v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-433/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
417v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155417v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/sha=
rd-dg2-433/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_oa@invalid-oa-metric-set=
-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-6/igt@xe_pmu@fn-eng=
ine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_query@multigpu-query-top=
ology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v2/shard-dg2-464/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155417v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard=
-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel X=
E#6168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155417v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155417v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/sha=
rd-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">In=
tel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155417v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg=
-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +9 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard=
-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-2/igt@kms_fli=
p@plain-flip-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shar=
d-adlp-4/igt@kms_flip@plain-flip-interruptible@d-hdmi-a1.html">PASS</a> +6 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-432/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#5416=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v2/shard-dg2-435/igt@kms_flip@plain-flip-ts-check-interruptible.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-2/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-=
dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-3/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v2/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-4/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-many-all.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155417v2/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-man=
y-all.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-bmg-7/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-lnl-4=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-adlp-2/igt@kms_fli=
p@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v2/shard-ad=
lp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155417v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5417v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55417v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5417v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">In=
tel XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155417v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_=
ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8 -&gt; xe-pw-155=
417v2</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8: c40150f969a0c5c5c08d7a2=
092485c008aea8fa8<br />
  xe-pw-155417v2: 155417v2</p>

</body>
</html>

--===============4186866129981256064==--
