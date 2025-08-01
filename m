Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FCAC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 04:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429B10E3A1;
	Fri,  1 Aug 2025 04:46:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64B410E3A1;
 Fri,  1 Aug 2025 04:46:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3270895604020999840=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/gsc=3A_Don=27t_crea?=
 =?utf-8?q?te_mei-gscfi_aux_device_while_running_in_VF_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 04:46:16 -0000
Message-ID: <175402357685.203913.11768298605017823461@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
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

--===============3270895604020999840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: Don't create mei-gscfi aux device while running in VF mode
URL   : https://patchwork.freedesktop.org/series/152383/
State : success

== Summary ==

CI Bug Log - changes from xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2_FULL -> xe-pw-152383v1_FULL
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

  Here are the changes found in xe-pw-152383v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#4947]) +17 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#607])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2191])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +146 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#306])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#1178]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#307])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1188])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#308])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#4633])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#4354])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#4422])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4950]) +60 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#4543]) +1 other test dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#2953] / [Intel XE#4173]) +15 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2293])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#651]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#653]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#1503])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4298])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#616]) +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#5020])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1122])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#4962]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_pm_rpm@i2c.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1489]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#4837]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4837])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_eudebug_online@resume-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1392]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#1392]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#288]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2360])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4943]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#4945]) +301 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#5018]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4915]) +84 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#560])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#3573]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2284] / [Intel XE#366])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#5694])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4733])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4130])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][76] ([Intel XE#4963]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [SKIP][82] ([Intel XE#4950]) -> [PASS][83] +29 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][84] ([Intel XE#2291]) -> [PASS][85] +4 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-c:
    - shard-dg2-set2:     [DMESG-WARN][86] -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-c.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-c.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][88] ([Intel XE#2373]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][90] ([Intel XE#2316]) -> [PASS][91] +5 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [DMESG-WARN][92] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#4543]) -> [PASS][95] +5 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][96] ([Intel XE#301]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][98] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][100] ([Intel XE#4596]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][102] ([Intel XE#4947]) -> [PASS][103] +7 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][104] ([Intel XE#1435]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][106] ([Intel XE#4945]) -> [PASS][107] +168 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1392]) -> [PASS][109] +4 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [INCOMPLETE][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][112] ([Intel XE#2229]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][114] ([Intel XE#2370]) -> [SKIP][115] ([Intel XE#4950])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][116] ([Intel XE#4947]) -> [SKIP][117] ([Intel XE#2327]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][118] ([Intel XE#2327]) -> [SKIP][119] ([Intel XE#4947]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][120] ([Intel XE#1124]) -> [SKIP][121] ([Intel XE#4947]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][122] ([Intel XE#2328]) -> [SKIP][123] ([Intel XE#4947])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][124] ([Intel XE#4947]) -> [SKIP][125] ([Intel XE#1124]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][126] ([Intel XE#4947]) -> [SKIP][127] ([Intel XE#607])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][128] ([Intel XE#610]) -> [SKIP][129] ([Intel XE#4947])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][130] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][131] ([Intel XE#4950])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][132] ([Intel XE#4950]) -> [SKIP][133] ([Intel XE#367])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][134] ([Intel XE#367]) -> [SKIP][135] ([Intel XE#4950]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][136] ([Intel XE#2887]) -> [SKIP][137] ([Intel XE#4947]) +12 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][138] ([Intel XE#4947]) -> [SKIP][139] ([Intel XE#2887]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          [SKIP][140] ([Intel XE#2252]) -> [SKIP][141] ([Intel XE#4950]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          [SKIP][142] ([Intel XE#4950]) -> [SKIP][143] ([Intel XE#2252]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][144] ([Intel XE#4950]) -> [FAIL][145] ([Intel XE#1178])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][146] ([Intel XE#2341]) -> [FAIL][147] ([Intel XE#1178])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][148] ([Intel XE#2341]) -> [SKIP][149] ([Intel XE#4950])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_content_protection@mei-interface.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][150] ([Intel XE#2341]) -> [FAIL][151] ([Intel XE#1188])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@uevent.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][152] ([Intel XE#2320]) -> [SKIP][153] ([Intel XE#4950]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][154] ([Intel XE#2321]) -> [SKIP][155] ([Intel XE#4950]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][156] ([Intel XE#4950]) -> [SKIP][157] ([Intel XE#2321]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][158] ([Intel XE#4950]) -> [SKIP][159] ([Intel XE#2291]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][160] ([Intel XE#2286]) -> [SKIP][161] ([Intel XE#4950])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][162] ([Intel XE#4947]) -> [SKIP][163] ([Intel XE#4354])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][164] ([Intel XE#4354]) -> [SKIP][165] ([Intel XE#4947])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][166] ([Intel XE#2244]) -> [SKIP][167] ([Intel XE#4947])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][168] ([Intel XE#4947]) -> [SKIP][169] ([Intel XE#2244])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][170] ([Intel XE#4950]) -> [SKIP][171] ([Intel XE#1138])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][172] ([Intel XE#2375]) -> [SKIP][173] ([Intel XE#4950])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][174] ([Intel XE#4950]) -> [SKIP][175] ([Intel XE#2316]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][176] ([Intel XE#4947]) -> [SKIP][177] ([Intel XE#2293] / [Intel XE#2380])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][178] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][179] ([Intel XE#4947]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#2311]) -> [SKIP][181] ([Intel XE#4947]) +21 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#2311]) +11 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][184] ([Intel XE#2311]) -> [SKIP][185] ([Intel XE#2312]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][186] ([Intel XE#5390]) -> [SKIP][187] ([Intel XE#4947]) +8 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][188] ([Intel XE#4947]) -> [SKIP][189] ([Intel XE#5390]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][190] ([Intel XE#2312]) -> [SKIP][191] ([Intel XE#5390]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][192] ([Intel XE#5390]) -> [SKIP][193] ([Intel XE#2312]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][194] ([Intel XE#2352]) -> [SKIP][195] ([Intel XE#4947])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#2311]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#2313]) +12 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][200] ([Intel XE#2313]) -> [SKIP][201] ([Intel XE#2312]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][202] ([Intel XE#2313]) -> [SKIP][203] ([Intel XE#4947]) +21 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][204] ([Intel XE#4947]) -> [SKIP][205] ([Intel XE#2313]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][206] ([Intel XE#4947]) -> [SKIP][207] ([Intel XE#5672])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][208] ([Intel XE#4947]) -> [SKIP][209] ([Intel XE#2312]) +10 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][210] ([Intel XE#4950]) -> [SKIP][211] ([Intel XE#1503])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][212] ([Intel XE#2927]) -> [SKIP][213] ([Intel XE#4947])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][214] ([Intel XE#4947]) -> [SKIP][215] ([Intel XE#2934])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][216] ([Intel XE#4950]) -> [SKIP][217] ([Intel XE#2393]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][218] ([Intel XE#2763]) -> [SKIP][219] ([Intel XE#4950])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][220] ([Intel XE#870]) -> [SKIP][221] ([Intel XE#4947]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][222] ([Intel XE#4962]) -> [SKIP][223] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][224] ([Intel XE#4947]) -> [SKIP][225] ([Intel XE#1489]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][226] ([Intel XE#1489]) -> [SKIP][227] ([Intel XE#4947]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][228] ([Intel XE#4947]) -> [SKIP][229] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][230] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][231] ([Intel XE#4947]) +10 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][232] ([Intel XE#4950]) -> [SKIP][233] ([Intel XE#2330]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][234] ([Intel XE#2330]) -> [SKIP][235] ([Intel XE#4950])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][236] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][237] ([Intel XE#4950]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][238] ([Intel XE#2413]) -> [SKIP][239] ([Intel XE#4950])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][240] ([Intel XE#1435]) -> [SKIP][241] ([Intel XE#4950])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][242] ([Intel XE#4950]) -> [SKIP][243] ([Intel XE#2426])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#362]) -> [SKIP][245] ([Intel XE#1500])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][246] ([Intel XE#4950]) -> [SKIP][247] ([Intel XE#2168])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@cmrr.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][248] ([Intel XE#1499]) -> [SKIP][249] ([Intel XE#4950]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][250] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][251] ([Intel XE#4950])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][252] ([Intel XE#4950]) -> [SKIP][253] ([Intel XE#1091] / [Intel XE#2849])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][254] ([Intel XE#2504]) -> [SKIP][255] ([Intel XE#4945])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          [SKIP][256] ([Intel XE#4837]) -> [SKIP][257] ([Intel XE#4945]) +9 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_eudebug@read-metadata.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][258] ([Intel XE#4518]) -> [SKIP][259] ([Intel XE#4945])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][260] ([Intel XE#2322]) -> [SKIP][261] ([Intel XE#4945]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][262] ([Intel XE#4945]) -> [SKIP][263] ([Intel XE#2322]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][264] ([Intel XE#4945]) -> [SKIP][265] ([Intel XE#4837]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][266] ([Intel XE#4943]) -> [SKIP][267] ([Intel XE#4945]) +14 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][268] ([Intel XE#4945]) -> [SKIP][269] ([Intel XE#4943]) +11 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][270] ([Intel XE#4945]) -> [ABORT][271] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][272] ([Intel XE#586]) -> [SKIP][273] ([Intel XE#4945])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_mmap@small-bar.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][274] ([Intel XE#2248]) -> [SKIP][275] ([Intel XE#4945])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][276] ([Intel XE#4945]) -> [SKIP][277] ([Intel XE#2245])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][278] ([Intel XE#4945]) -> [SKIP][279] ([Intel XE#2236])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][280] ([Intel XE#2284]) -> [SKIP][281] ([Intel XE#4945]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][282] ([Intel XE#4945]) -> [SKIP][283] ([Intel XE#4733])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pxp@pxp-optout.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][284] ([Intel XE#4733]) -> [SKIP][285] ([Intel XE#4945])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][286] ([Intel XE#4945]) -> [SKIP][287] ([Intel XE#944])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][288] ([Intel XE#944]) -> [SKIP][289] ([Intel XE#4945]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][290] ([Intel XE#3342]) -> [SKIP][291] ([Intel XE#4945])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
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
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2 -> xe-pw-152383v1

  IGT_8482: 8482
  xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2: 68a99106069be8ab52030c61215da008b2f6dbd2
  xe-pw-152383v1: 152383v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/index.html

--===============3270895604020999840==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: Don&#x27;t create mei-gscfi aux device while running in VF mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152383/">https://patchwork.freedesktop.org/series/152383/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2_FULL -&gt; xe-pw-152383v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152383v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +301 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +168 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-3/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152383v1/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2 -&gt; xe-pw-152383v1</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3496-68a99106069be8ab52030c61215da008b2f6dbd2: 68a99106069be8ab52030c61215da008b2f6dbd2<br />
  xe-pw-152383v1: 152383v1</p>

</body>
</html>

--===============3270895604020999840==--
