Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23B7C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 05:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB9110E3B0;
	Fri,  1 Aug 2025 05:34:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910E210E3AC;
 Fri,  1 Aug 2025 05:34:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7842885440154613709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/vf=3A_Post-migratio?=
 =?utf-8?q?n_recovery_of_queues_and_jobs_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 05:34:39 -0000
Message-ID: <175402647958.204201.9046450692151258546@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250801015045.957609-1-tomasz.lis@intel.com>
In-Reply-To: <20250801015045.957609-1-tomasz.lis@intel.com>
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

--===============7842885440154613709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev9)
URL   : https://patchwork.freedesktop.org/series/148982/
State : success

== Summary ==

CI Bug Log - changes from xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2_FULL -> xe-pw-148982v9_FULL
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

  Here are the changes found in xe-pw-148982v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#4947]) +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#607])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +202 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2705] / [Intel XE#4212]) +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#4417]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#4416]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#307])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#1178]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#1188])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1188])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#2953] / [Intel XE#4173])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
    - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#4633])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4494])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4354])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#4543])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-3/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#651]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2311]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#653]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4298])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#5020])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1122])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#4962])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_rpm@universal-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1489])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2850] / [Intel XE#929])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#4950]) +67 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_sequence@get-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_sequence@get-idle.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4837]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4837])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_eudebug_online@resume-one.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#1392]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2322])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#288]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2360])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4943]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4945]) +299 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#5018]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4915]) +45 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3573]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1173])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#5694])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4733])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][76] ([Intel XE#4963]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][78] ([Intel XE#2134]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@fbdev@eof.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@fbdev@eof.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][80] ([Intel XE#4543]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [SKIP][84] ([Intel XE#4950]) -> [PASS][85] +55 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][86] ([Intel XE#2291]) -> [PASS][87] +4 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-c:
    - shard-dg2-set2:     [DMESG-WARN][88] -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-c.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-c.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][90] ([Intel XE#2373]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][92] ([Intel XE#2316]) -> [PASS][93] +5 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][96] ([Intel XE#4543]) -> [PASS][97] +4 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][98] ([Intel XE#301]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][100] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][102] ([Intel XE#4596]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][104] ([Intel XE#4947]) -> [PASS][105] +14 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][106] ([Intel XE#1435]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][108] ([Intel XE#4945]) -> [PASS][109] +271 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1392]) -> [PASS][111] +6 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [INCOMPLETE][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][114] ([Intel XE#2229]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][116] ([Intel XE#3768]) -> [SKIP][117] ([Intel XE#4950])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][118] ([Intel XE#2327]) -> [SKIP][119] ([Intel XE#4947])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][120] ([Intel XE#4947]) -> [SKIP][121] ([Intel XE#2327]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][122] ([Intel XE#4947]) -> [SKIP][123] ([Intel XE#1124]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][124] ([Intel XE#4947]) -> [SKIP][125] ([Intel XE#607])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][126] ([Intel XE#1124]) -> [SKIP][127] ([Intel XE#4947]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][128] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][129] ([Intel XE#4950])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][130] ([Intel XE#4950]) -> [SKIP][131] ([Intel XE#367]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][132] ([Intel XE#367]) -> [SKIP][133] ([Intel XE#4950]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][134] ([Intel XE#4947]) -> [SKIP][135] ([Intel XE#2887]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][136] ([Intel XE#2887]) -> [SKIP][137] ([Intel XE#4947]) +11 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][138] ([Intel XE#4947]) -> [SKIP][139] ([Intel XE#3432])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][140] ([Intel XE#2325]) -> [SKIP][141] ([Intel XE#4950]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][142] ([Intel XE#2252]) -> [SKIP][143] ([Intel XE#4950]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][144] ([Intel XE#4950]) -> [SKIP][145] ([Intel XE#2252]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][146] ([Intel XE#4950]) -> [FAIL][147] ([Intel XE#1178])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][148] ([Intel XE#2341]) -> [SKIP][149] ([Intel XE#4950]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][150] ([Intel XE#2390]) -> [SKIP][151] ([Intel XE#4950])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][152] ([Intel XE#1178]) -> [SKIP][153] ([Intel XE#2341])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-7/igt@kms_content_protection@legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][154] ([Intel XE#2341]) -> [FAIL][155] ([Intel XE#1178])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][156] ([Intel XE#2341]) -> [FAIL][157] ([Intel XE#1188])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@uevent.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][158] ([Intel XE#2320]) -> [SKIP][159] ([Intel XE#4950]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][160] ([Intel XE#4950]) -> [SKIP][161] ([Intel XE#2320]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][162] ([Intel XE#2321]) -> [SKIP][163] ([Intel XE#4950])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][164] ([Intel XE#4950]) -> [SKIP][165] ([Intel XE#2321]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][166] ([Intel XE#5428]) -> [SKIP][167] ([Intel XE#4947])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][168] ([Intel XE#4354]) -> [SKIP][169] ([Intel XE#4947])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][170] ([Intel XE#4947]) -> [SKIP][171] ([Intel XE#2244])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][172] ([Intel XE#2373]) -> [SKIP][173] ([Intel XE#4950])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][174] ([Intel XE#4950]) -> [SKIP][175] ([Intel XE#1138])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][176] ([Intel XE#2375]) -> [SKIP][177] ([Intel XE#4950])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][178] ([Intel XE#301]) -> [FAIL][179] ([Intel XE#301] / [Intel XE#3149])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][180] ([Intel XE#4947]) -> [SKIP][181] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][182] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][183] ([Intel XE#4947]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][184] ([Intel XE#2380]) -> [SKIP][185] ([Intel XE#4947])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][186] ([Intel XE#2311]) -> [SKIP][187] ([Intel XE#4947]) +22 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][188] ([Intel XE#2312]) -> [SKIP][189] ([Intel XE#2311]) +11 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][190] ([Intel XE#2311]) -> [SKIP][191] ([Intel XE#2312]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][192] ([Intel XE#4947]) -> [SKIP][193] ([Intel XE#5390]) +11 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#5390]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][196] ([Intel XE#5390]) -> [SKIP][197] ([Intel XE#4947]) +6 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][198] ([Intel XE#5390]) -> [SKIP][199] ([Intel XE#2312]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][200] ([Intel XE#4947]) -> [SKIP][201] ([Intel XE#2311]) +15 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2313]) +12 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][204] ([Intel XE#2313]) -> [SKIP][205] ([Intel XE#2312]) +10 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][206] ([Intel XE#4947]) -> [SKIP][207] ([Intel XE#5672])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#4947]) +21 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][210] ([Intel XE#4947]) -> [SKIP][211] ([Intel XE#2313]) +16 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][212] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][213] ([Intel XE#3544])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][214] ([Intel XE#2934]) -> [SKIP][215] ([Intel XE#4947])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][216] ([Intel XE#346]) -> [SKIP][217] ([Intel XE#4947])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][218] ([Intel XE#4947]) -> [SKIP][219] ([Intel XE#2934])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][220] ([Intel XE#4950]) -> [SKIP][221] ([Intel XE#2393]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][222] ([Intel XE#4950]) -> [SKIP][223] ([Intel XE#5021])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][224] ([Intel XE#870]) -> [SKIP][225] ([Intel XE#4947])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][226] ([Intel XE#734]) -> [FAIL][227] ([Intel XE#3325])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][228] ([Intel XE#4947]) -> [SKIP][229] ([Intel XE#2505])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][230] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][231] ([Intel XE#4962])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][232] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][233] ([Intel XE#4962])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][234] ([Intel XE#4962]) -> [SKIP][235] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][236] ([Intel XE#4947]) -> [SKIP][237] ([Intel XE#1489]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][238] ([Intel XE#1489]) -> [SKIP][239] ([Intel XE#4947]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#4947]) -> [SKIP][241] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          [SKIP][242] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][243] ([Intel XE#4947]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr@psr-sprite-plane-move.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][244] ([Intel XE#4950]) -> [SKIP][245] ([Intel XE#2330]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][246] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][247] ([Intel XE#4950])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][248] ([Intel XE#2330]) -> [SKIP][249] ([Intel XE#4950])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][250] ([Intel XE#1435]) -> [SKIP][251] ([Intel XE#4950]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][252] ([Intel XE#4950]) -> [SKIP][253] ([Intel XE#2426])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#362]) -> [SKIP][255] ([Intel XE#1500])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][256] ([Intel XE#4950]) -> [SKIP][257] ([Intel XE#2168])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@cmrr.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][258] ([Intel XE#1499]) -> [SKIP][259] ([Intel XE#4950]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][260] ([Intel XE#4950]) -> [SKIP][261] ([Intel XE#1499])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][262] ([Intel XE#4950]) -> [SKIP][263] ([Intel XE#1091] / [Intel XE#2849])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][264] ([Intel XE#4837]) -> [SKIP][265] ([Intel XE#4945]) +8 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-discovery.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][266] ([Intel XE#2322]) -> [SKIP][267] ([Intel XE#4945]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][268] ([Intel XE#4945]) -> [SKIP][269] ([Intel XE#2322]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][270] ([Intel XE#4945]) -> [SKIP][271] ([Intel XE#4837]) +9 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][272] ([Intel XE#4943]) -> [SKIP][273] ([Intel XE#4945]) +21 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][274] ([Intel XE#4945]) -> [SKIP][275] ([Intel XE#4943]) +17 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][276] ([Intel XE#4945]) -> [ABORT][277] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][278] ([Intel XE#4945]) -> [SKIP][279] ([Intel XE#2245])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][280] ([Intel XE#4945]) -> [SKIP][281] ([Intel XE#2236])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1061]) -> [FAIL][283] ([Intel XE#1173])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_peer2peer@read.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][284] ([Intel XE#2284]) -> [SKIP][285] ([Intel XE#4945]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][286] ([Intel XE#4733]) -> [SKIP][287] ([Intel XE#4945])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][288] ([Intel XE#4945]) -> [SKIP][289] ([Intel XE#4733]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][290] ([Intel XE#4945]) -> [SKIP][291] ([Intel XE#944])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][292] ([Intel XE#944]) -> [SKIP][293] ([Intel XE#4945]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][294] ([Intel XE#4130]) -> [SKIP][295] ([Intel XE#4945])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][296] ([Intel XE#3342]) -> [SKIP][297] ([Intel XE#4945])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][298] ([Intel XE#4945]) -> [SKIP][299] ([Intel XE#4273])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
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
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2 -> xe-pw-148982v9

  IGT_8482: 8482
  xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2: 68a99106069be8ab52030c61215da008b2f6dbd2
  xe-pw-148982v9: 148982v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/index.html

--===============7842885440154613709==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of queues and jobs (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148982/">https://patchwork.freedesktop.org/series/148982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2_FULL -&gt; xe-pw-148982v9_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148982v9_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +202 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-3/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +299 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +55 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +271 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428">Intel XE#5428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-3/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v9/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2 -&gt; xe-pw-148982v9</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2: 68a99106069be8ab52030c61215da008b2f6dbd2<br />
  xe-pw-148982v9: 148982v9</p>

</body>
</html>

--===============7842885440154613709==--
