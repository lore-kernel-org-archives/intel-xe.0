Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575A6C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 13:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BAF10E853;
	Fri,  1 Aug 2025 13:41:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AB010E84C;
 Fri,  1 Aug 2025 13:41:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2341794797080635180=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Mark_xe_driver_as_BROKEN_i?=
 =?utf-8?q?f_kernel_page_size_is_not_4kB_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: simon.richter@hogyros.de
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 13:41:05 -0000
Message-ID: <175405566593.205078.9722761199312092271@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250727070413.9743-1-Simon.Richter@hogyros.de>
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

--===============2341794797080635180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Mark xe driver as BROKEN if kernel page size is not 4kB (rev2)
URL   : https://patchwork.freedesktop.org/series/152145/
State : success

== Summary ==

CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_FULL -> xe-pw-152145v2_FULL
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

  Here are the changes found in xe-pw-152145v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#5715])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@fbdev@unaligned-write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@fbdev@unaligned-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#4947]) +21 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#4543]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#607])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +76 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#306])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#1178])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#5354])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#4494])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4543])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][23] ([Intel XE#2049] / [Intel XE#2597])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#651]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#653]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#455])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#4950]) +127 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2763]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#4962]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2850] / [Intel XE#929])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#4459]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4837])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#1392]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#288]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#4945]) +609 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#5018]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4915]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#4733])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-3/igt@xe_wedged@basic-wedged.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-1/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][49] ([Intel XE#4672]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@core_getversion@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][51] ([Intel XE#4963]) -> [PASS][52] +1 other test pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][53] ([Intel XE#5547]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][55] ([Intel XE#4947]) -> [PASS][56] +13 other tests pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][57] ([Intel XE#4543]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][59] ([Intel XE#5354]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][61] ([Intel XE#4633]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-dg2-set2:     [FAIL][63] ([Intel XE#3098]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][65] ([Intel XE#2316]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [DMESG-WARN][67] ([Intel XE#4543]) -> [PASS][68] +3 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][69] ([Intel XE#301]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-lnl:          [FAIL][71] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][73] ([Intel XE#301]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][75] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][76] +5 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][77] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][79] ([Intel XE#4962]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][81] ([Intel XE#4950]) -> [PASS][82] +71 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1392]) -> [PASS][84] +3 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][85] ([Intel XE#3876]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [SKIP][87] ([Intel XE#4945]) -> [PASS][88] +374 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][89] ([Intel XE#2229]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][91] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][92] +3 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][93] ([Intel XE#4950]) -> [SKIP][94] ([Intel XE#2233])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][95] ([Intel XE#873]) -> [SKIP][96] ([Intel XE#4950])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][97] ([Intel XE#2370]) -> [SKIP][98] ([Intel XE#4950])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][99] ([Intel XE#2327]) -> [SKIP][100] ([Intel XE#4947]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][101] ([Intel XE#4947]) -> [SKIP][102] ([Intel XE#2327]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][103] ([Intel XE#4947]) -> [SKIP][104] ([Intel XE#1124]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][105] ([Intel XE#2328]) -> [SKIP][106] ([Intel XE#4947])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][107] ([Intel XE#4947]) -> [SKIP][108] ([Intel XE#610])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][109] ([Intel XE#1124]) -> [SKIP][110] ([Intel XE#4947]) +12 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][111] ([Intel XE#4947]) -> [SKIP][112] ([Intel XE#2328])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][113] ([Intel XE#610]) -> [SKIP][114] ([Intel XE#4947])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][115] ([Intel XE#4950]) -> [SKIP][116] ([Intel XE#2314] / [Intel XE#2894])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][117] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][118] ([Intel XE#4950]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][119] ([Intel XE#4950]) -> [SKIP][120] ([Intel XE#367])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][121] ([Intel XE#367]) -> [SKIP][122] ([Intel XE#4950]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][123] ([Intel XE#4947]) -> [SKIP][124] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][125] ([Intel XE#2887]) -> [SKIP][126] ([Intel XE#4947]) +22 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][127] ([Intel XE#4947]) -> [SKIP][128] ([Intel XE#2887]) +10 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][129] ([Intel XE#3432]) -> [SKIP][130] ([Intel XE#4947])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][131] ([Intel XE#4947]) -> [SKIP][132] ([Intel XE#3432]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][133] ([Intel XE#2724]) -> [SKIP][134] ([Intel XE#4947]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][135] ([Intel XE#4950]) -> [SKIP][136] ([Intel XE#2325])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][137] ([Intel XE#2325]) -> [SKIP][138] ([Intel XE#4950])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_chamelium_color@gamma.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][139] ([Intel XE#4950]) -> [SKIP][140] ([Intel XE#2252]) +9 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][141] ([Intel XE#2252]) -> [SKIP][142] ([Intel XE#4950]) +12 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][143] ([Intel XE#4950]) -> [SKIP][144] ([Intel XE#2341])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][145] ([Intel XE#4950]) -> [SKIP][146] ([Intel XE#2390]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][147] ([Intel XE#2390]) -> [SKIP][148] ([Intel XE#4950])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][149] ([Intel XE#1178]) -> [SKIP][150] ([Intel XE#4950]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_content_protection@legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][151] ([Intel XE#4950]) -> [FAIL][152] ([Intel XE#1178])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][153] ([Intel XE#1188]) -> [SKIP][154] ([Intel XE#4950])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_content_protection@uevent.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][155] ([Intel XE#2320]) -> [SKIP][156] ([Intel XE#4950]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][157] ([Intel XE#2321]) -> [SKIP][158] ([Intel XE#4950]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][159] ([Intel XE#4950]) -> [SKIP][160] ([Intel XE#2320]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_crc@cursor-random-64x21.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][161] ([Intel XE#4950]) -> [SKIP][162] ([Intel XE#2321]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][163] ([Intel XE#2291]) -> [SKIP][164] ([Intel XE#4950]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][165] ([Intel XE#4950]) -> [SKIP][166] ([Intel XE#2291])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][167] ([Intel XE#1475]) -> [SKIP][168] ([Intel XE#4950])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][169] ([Intel XE#2286]) -> [SKIP][170] ([Intel XE#4950])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][171] ([Intel XE#2244]) -> [SKIP][172] ([Intel XE#4947]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][173] ([Intel XE#4947]) -> [SKIP][174] ([Intel XE#2244]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][175] ([Intel XE#4422]) -> [SKIP][176] ([Intel XE#4945])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][177] ([Intel XE#5425]) -> [SKIP][178] ([Intel XE#4947])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][179] ([Intel XE#776]) -> [SKIP][180] ([Intel XE#4947])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][181] ([Intel XE#4950]) -> [SKIP][182] ([Intel XE#1138])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][183] ([Intel XE#2316]) -> [SKIP][184] ([Intel XE#4950]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][185] ([Intel XE#4950]) -> [SKIP][186] ([Intel XE#2316]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][187] ([Intel XE#4947]) -> [SKIP][188] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][189] ([Intel XE#2380]) -> [SKIP][190] ([Intel XE#4947])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][191] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][192] ([Intel XE#4947]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2311]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][195] ([Intel XE#2311]) -> [SKIP][196] ([Intel XE#4947]) +41 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][197] ([Intel XE#4947]) -> [SKIP][198] ([Intel XE#2311]) +19 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#5390]) -> [SKIP][200] ([Intel XE#4947]) +18 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][201] ([Intel XE#4947]) -> [SKIP][202] ([Intel XE#5390]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#5390]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][205] ([Intel XE#4947]) -> [SKIP][206] ([Intel XE#2312]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         [SKIP][207] ([Intel XE#1151]) -> [SKIP][208] ([Intel XE#4947])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#4947]) +7 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][211] ([Intel XE#2352]) -> [SKIP][212] ([Intel XE#4947]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][213] ([Intel XE#4947]) -> [SKIP][214] ([Intel XE#5672])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#2313]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][217] ([Intel XE#2313]) -> [SKIP][218] ([Intel XE#4947]) +37 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][219] ([Intel XE#4947]) -> [SKIP][220] ([Intel XE#2313]) +20 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][221] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][222] ([Intel XE#4950])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][223] ([Intel XE#4950]) -> [SKIP][224] ([Intel XE#1503])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_hdr@static-swap.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][225] ([Intel XE#346]) -> [SKIP][226] ([Intel XE#4947]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][227] ([Intel XE#4947]) -> [SKIP][228] ([Intel XE#2934])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][229] ([Intel XE#2927]) -> [SKIP][230] ([Intel XE#4947])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][231] ([Intel XE#4950]) -> [SKIP][232] ([Intel XE#2486])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][233] ([Intel XE#4950]) -> [SKIP][234] ([Intel XE#2393])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][235] ([Intel XE#5020]) -> [SKIP][236] ([Intel XE#4950])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][237] ([Intel XE#4950]) -> [SKIP][238] ([Intel XE#2763])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][239] ([Intel XE#2763]) -> [SKIP][240] ([Intel XE#4950])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][241] ([Intel XE#2938]) -> [SKIP][242] ([Intel XE#4947])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][243] ([Intel XE#4947]) -> [SKIP][244] ([Intel XE#870]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][245] ([Intel XE#870]) -> [SKIP][246] ([Intel XE#4947])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][247] ([Intel XE#2392]) -> [SKIP][248] ([Intel XE#4947])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][249] ([Intel XE#4947]) -> [SKIP][250] ([Intel XE#2392])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][251] ([Intel XE#2499]) -> [SKIP][252] ([Intel XE#4947])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][253] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][254] ([Intel XE#4962])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][255] ([Intel XE#4947]) -> [SKIP][256] ([Intel XE#1489]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][257] ([Intel XE#1489]) -> [SKIP][258] ([Intel XE#4947]) +11 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][259] ([Intel XE#2387]) -> [SKIP][260] ([Intel XE#4947])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][261] ([Intel XE#4947]) -> [SKIP][262] ([Intel XE#2387])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][263] ([Intel XE#4947]) -> [SKIP][264] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#4947]) -> [SKIP][266] ([Intel XE#2234])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][267] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][268] ([Intel XE#4947]) +20 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_psr@psr2-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][269] ([Intel XE#4947]) -> [SKIP][270] ([Intel XE#2414])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][271] ([Intel XE#2414]) -> [SKIP][272] ([Intel XE#4947])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][273] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][274] ([Intel XE#4950])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][275] ([Intel XE#4950]) -> [SKIP][276] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][277] ([Intel XE#2413]) -> [SKIP][278] ([Intel XE#4950])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][279] ([Intel XE#1435]) -> [SKIP][280] ([Intel XE#4950])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][281] ([Intel XE#4950]) -> [SKIP][282] ([Intel XE#2426])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#1729]) -> [SKIP][284] ([Intel XE#362])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][285] ([Intel XE#2426]) -> [SKIP][286] ([Intel XE#2509])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][287] ([Intel XE#2450]) -> [SKIP][288] ([Intel XE#4950])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][289] ([Intel XE#1499]) -> [SKIP][290] ([Intel XE#4950]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_vrr@flip-basic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][291] ([Intel XE#4950]) -> [SKIP][292] ([Intel XE#1091] / [Intel XE#2849])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][293] ([Intel XE#4837]) -> [SKIP][294] ([Intel XE#4945]) +17 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][295] ([Intel XE#4945]) -> [SKIP][296] ([Intel XE#4837]) +12 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][297] ([Intel XE#4518]) -> [SKIP][298] ([Intel XE#4945])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][299] ([Intel XE#2322]) -> [SKIP][300] ([Intel XE#4945]) +12 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][301] ([Intel XE#4945]) -> [SKIP][302] ([Intel XE#2322]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][303] ([Intel XE#4943]) -> [SKIP][304] ([Intel XE#4945]) +38 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][305] ([Intel XE#4945]) -> [SKIP][306] ([Intel XE#4943]) +22 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][307] ([Intel XE#4945]) -> [ABORT][308] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][309] ([Intel XE#4945]) -> [ABORT][310] ([Intel XE#5530])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][311] ([Intel XE#586]) -> [SKIP][312] ([Intel XE#4945])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_mmap@small-bar.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [FAIL][313] ([Intel XE#5507]) -> [SKIP][314] ([Intel XE#4945])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_pat@pat-index-xe2.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][315] ([Intel XE#4945]) -> [SKIP][316] ([Intel XE#2245])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][317] ([Intel XE#4945]) -> [SKIP][318] ([Intel XE#2284])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][319] ([Intel XE#2284]) -> [SKIP][320] ([Intel XE#4945]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][321] ([Intel XE#4945]) -> [SKIP][322] ([Intel XE#5695])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][323] ([Intel XE#4733]) -> [SKIP][324] ([Intel XE#4945]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [SKIP][325] ([Intel XE#4945]) -> [SKIP][326] ([Intel XE#4733]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][327] ([Intel XE#944]) -> [SKIP][328] ([Intel XE#4945]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][329] ([Intel XE#4945]) -> [SKIP][330] ([Intel XE#944]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][331] ([Intel XE#4130]) -> [SKIP][332] ([Intel XE#4945]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][333] ([Intel XE#4945]) -> [SKIP][334] ([Intel XE#4130])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][335] ([Intel XE#4273]) -> [SKIP][336] ([Intel XE#4945])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [SKIP][337] ([Intel XE#4351]) -> [SKIP][338] ([Intel XE#4945])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5715
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -> xe-pw-152145v2

  IGT_8482: 8482
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f
  xe-pw-152145v2: 152145v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/index.html

--===============2341794797080635180==
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
<tr><td><b>Series:</b></td><td>Mark xe driver as BROKEN if kernel page size is not 4kB (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152145/">https://patchwork.freedesktop.org/series/152145/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_FULL -&gt; xe-pw-152145v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152145v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5715">Intel XE#5715</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +609 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-3/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547">Intel XE#5547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html">PASS</a> +71 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> +374 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_pat@pat-index-xe2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v2/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -&gt; xe-pw-152145v2</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f<br />
  xe-pw-152145v2: 152145v2</p>

</body>
</html>

--===============2341794797080635180==--
