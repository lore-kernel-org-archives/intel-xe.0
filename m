Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F273C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 10:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9610E1A8;
	Wed, 30 Jul 2025 10:30:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ABE10E164;
 Wed, 30 Jul 2025 10:30:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6494849764293951215=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Patch_=22Revert_=22drm/xe/?=
 =?utf-8?q?tests/mocs=3A_Update_xe=5Fforce=5Fwake=5Fget=28=29_return_handlin?=
 =?utf-8?q?g=22=22_has_been_added_to_the_6=2E12-stable_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 10:30:12 -0000
Message-ID: <175387141206.197930.13303511469128038406@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729110525.49838-3-tomitamoeko@gmail.com>
In-Reply-To: <20250729110525.49838-3-tomitamoeko@gmail.com>
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

--===============6494849764293951215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"" has been added to the 6.12-stable tree
URL   : https://patchwork.freedesktop.org/series/152266/
State : failure

== Summary ==

CI Bug Log - changes from xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741_FULL -> xe-pw-152266v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152266v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152266v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152266v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [TIMEOUT][2] +1 other test timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-bmg:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-lnl:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-152266v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#4963])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@core_hotunplug@hotrebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@core_hotunplug@hotrebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#5547])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@fbdev@pan.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@fbdev@pan.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#4947]) +18 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#4543])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +139 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#1475])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1340])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#776])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2316])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#4543]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2293]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2312]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5390])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2313]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3544])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#616]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2763]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2499])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#4962]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4950]) +79 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1489])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1489])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1127])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#3414])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2168])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1499])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#2142]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4837])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug@connect-user:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4837])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_eudebug@connect-user.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#1392]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#288])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4208]) +27 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4915]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4943]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2229]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1420])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2953] / [Intel XE#4173]) +13 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-3/igt@xe_pm@s2idle-multiple-execs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4733])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_pxp@pxp-optout.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4351])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-435/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#4945]) +398 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][77] ([Intel XE#4963]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][81] ([Intel XE#2134]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@fbdev@unaligned-write.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [SKIP][83] ([Intel XE#4950]) -> [PASS][84] +62 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_addfb_basic@legacy-format.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-2/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [SKIP][87] ([Intel XE#4947]) -> [PASS][88] +17 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][91] ([Intel XE#5299]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][93] ([Intel XE#301]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][95] ([Intel XE#4543]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][97] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][99] ([Intel XE#5208]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][101] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][105] ([Intel XE#4962]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1392]) -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][109] ([Intel XE#4945]) -> [PASS][110] +318 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][111] ([Intel XE#5018]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][113] ([Intel XE#4947]) -> [SKIP][114] ([Intel XE#2327])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][115] ([Intel XE#2327]) -> [SKIP][116] ([Intel XE#4947]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][117] ([Intel XE#4947]) -> [SKIP][118] ([Intel XE#1124]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][119] ([Intel XE#1124]) -> [SKIP][120] ([Intel XE#4947]) +12 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][121] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][122] ([Intel XE#4950])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][123] ([Intel XE#4950]) -> [SKIP][124] ([Intel XE#2314] / [Intel XE#2894])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][125] ([Intel XE#367]) -> [SKIP][126] ([Intel XE#4950]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][127] ([Intel XE#4950]) -> [SKIP][128] ([Intel XE#367]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][129] ([Intel XE#4947]) -> [SKIP][130] ([Intel XE#2887]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][131] ([Intel XE#2887]) -> [SKIP][132] ([Intel XE#4947]) +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][133] ([Intel XE#4947]) -> [SKIP][134] ([Intel XE#3432])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][135] ([Intel XE#3432]) -> [SKIP][136] ([Intel XE#4947]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][137] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][139] ([Intel XE#2325]) -> [SKIP][140] ([Intel XE#4950]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][141] ([Intel XE#4950]) -> [SKIP][142] ([Intel XE#2325])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][143] ([Intel XE#2252]) -> [SKIP][144] ([Intel XE#4950]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#373]) -> [SKIP][146] ([Intel XE#4208] / [i915#2575])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][147] ([Intel XE#4950]) -> [SKIP][148] ([Intel XE#2252]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][149] ([Intel XE#1178]) -> [SKIP][150] ([Intel XE#4950]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_content_protection@atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][151] ([Intel XE#2390]) -> [SKIP][152] ([Intel XE#4950]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][153] ([Intel XE#1188]) -> [SKIP][154] ([Intel XE#4950])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_content_protection@uevent.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][155] ([Intel XE#4950]) -> [SKIP][156] ([Intel XE#2320]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][157] ([Intel XE#4950]) -> [SKIP][158] ([Intel XE#2321])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][159] ([Intel XE#2320]) -> [SKIP][160] ([Intel XE#4950]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][161] ([Intel XE#2321]) -> [SKIP][162] ([Intel XE#4950]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][163] ([Intel XE#2286]) -> [SKIP][164] ([Intel XE#4950])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][165] ([Intel XE#4354]) -> [SKIP][166] ([Intel XE#4947])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][167] ([Intel XE#2244]) -> [SKIP][168] ([Intel XE#4947]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][169] ([Intel XE#4945]) -> [SKIP][170] ([Intel XE#4422])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][171] ([Intel XE#5425]) -> [SKIP][172] ([Intel XE#4947])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][173] ([Intel XE#4950]) -> [SKIP][174] ([Intel XE#2372])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][175] ([Intel XE#1138]) -> [SKIP][176] ([Intel XE#4950])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][177] ([Intel XE#4950]) -> [SKIP][178] ([Intel XE#2374])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][179] ([Intel XE#4947]) -> [SKIP][180] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][181] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][182] ([Intel XE#4947]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#4947]) -> [SKIP][184] ([Intel XE#2311]) +21 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#2351] / [Intel XE#4208])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][187] ([Intel XE#2311]) -> [SKIP][188] ([Intel XE#4947]) +28 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#5390]) -> [SKIP][190] ([Intel XE#4947]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][191] ([Intel XE#4947]) -> [SKIP][192] ([Intel XE#5390]) +9 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#4947]) +29 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][195] ([Intel XE#4947]) -> [SKIP][196] ([Intel XE#2313]) +23 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][197] ([Intel XE#2350]) -> [SKIP][198] ([Intel XE#4947])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][199] ([Intel XE#2927]) -> [SKIP][200] ([Intel XE#4947]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][201] ([Intel XE#2486]) -> [SKIP][202] ([Intel XE#4950])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][203] ([Intel XE#4947]) -> [SKIP][204] ([Intel XE#4329])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][205] ([Intel XE#2393]) -> [SKIP][206] ([Intel XE#4950])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][207] ([Intel XE#5021]) -> [SKIP][208] ([Intel XE#4950])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][209] ([Intel XE#4950]) -> [SKIP][210] ([Intel XE#5020])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][211] ([Intel XE#4950]) -> [SKIP][212] ([Intel XE#2763])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][213] ([Intel XE#870]) -> [SKIP][214] ([Intel XE#4947])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][215] ([Intel XE#3309]) -> [SKIP][216] ([Intel XE#4947])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][217] ([Intel XE#734]) -> [FAIL][218] ([Intel XE#3325])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][219] ([Intel XE#4962]) -> [SKIP][220] ([Intel XE#1439] / [Intel XE#836])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][221] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][222] ([Intel XE#4962])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][223] ([Intel XE#1489]) -> [SKIP][224] ([Intel XE#4947]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][225] ([Intel XE#4947]) -> [SKIP][226] ([Intel XE#1489]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][227] ([Intel XE#4947]) -> [SKIP][228] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][229] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][230] ([Intel XE#4947]) +13 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][231] ([Intel XE#2414]) -> [SKIP][232] ([Intel XE#4947])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][233] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][234] ([Intel XE#4950]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][235] ([Intel XE#4950]) -> [SKIP][236] ([Intel XE#2330])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][237] ([Intel XE#2330]) -> [SKIP][238] ([Intel XE#4950])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][239] ([Intel XE#4950]) -> [SKIP][240] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][241] ([Intel XE#4950]) -> [SKIP][242] ([Intel XE#2426])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#362]) -> [SKIP][244] ([Intel XE#1500])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][245] ([Intel XE#2450]) -> [SKIP][246] ([Intel XE#4950])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][247] ([Intel XE#1499]) -> [SKIP][248] ([Intel XE#4950]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_vrr@flip-basic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][249] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][250] ([Intel XE#4950])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          [SKIP][251] ([Intel XE#4837]) -> [SKIP][252] ([Intel XE#4945]) +14 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_eudebug@read-metadata.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][253] ([Intel XE#4945]) -> [SKIP][254] ([Intel XE#4837]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [INCOMPLETE][255] ([Intel XE#4842] / [Intel XE#5515]) -> [SKIP][256] ([Intel XE#4208])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][257] ([Intel XE#2322]) -> [SKIP][258] ([Intel XE#4945]) +9 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][259] ([Intel XE#4945]) -> [SKIP][260] ([Intel XE#2322]) +8 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#288]) -> [SKIP][262] ([Intel XE#4208])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][263] ([Intel XE#4945]) -> [SKIP][264] ([Intel XE#4943]) +15 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4915]) -> [SKIP][266] ([Intel XE#4208])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race.html

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - shard-bmg:          [SKIP][267] ([Intel XE#4943]) -> [SKIP][268] ([Intel XE#4945]) +23 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_exec_system_allocator@twice-mmap-huge.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][269] ([Intel XE#4945]) -> [ABORT][270] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][271] ([Intel XE#4945]) -> [ABORT][272] ([Intel XE#5530])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][273] ([Intel XE#4945]) -> [SKIP][274] ([Intel XE#5694])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][275] ([Intel XE#2284]) -> [SKIP][276] ([Intel XE#4945]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [SKIP][277] ([Intel XE#4650]) -> [SKIP][278] ([Intel XE#4945])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_pmu@all-fn-engine-activity-load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][279] ([Intel XE#4733]) -> [SKIP][280] ([Intel XE#4945]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][281] ([Intel XE#4945]) -> [SKIP][282] ([Intel XE#4733]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][283] ([Intel XE#944]) -> [SKIP][284] ([Intel XE#4945]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][285] ([Intel XE#4945]) -> [SKIP][286] ([Intel XE#944])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][287] ([Intel XE#4945]) -> [SKIP][288] ([Intel XE#4130])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][289] ([Intel XE#4130]) -> [SKIP][290] ([Intel XE#4945]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][291] ([Intel XE#4273]) -> [SKIP][292] ([Intel XE#4945])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
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
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5515
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741 -> xe-pw-152266v1

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741: 9378b693d04cb60c6d1b13150244c480a7cd2741
  xe-pw-152266v1: 152266v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/index.html

--===============6494849764293951215==
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
<tr><td><b>Series:</b></td><td>Patch &quot;Revert &quot;drm/xe/tests/mocs: =
Update xe_force_wake_get() return handling&quot;&quot; has been added to th=
e 6.12-stable tree</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152266/">https://patchwork.freedesktop.org/series/152266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152266v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152266v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3487-9378b693d04cb60c6d1b13150244c480a=
7cd2741_FULL -&gt; xe-pw-152266v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152266v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152266v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1522=
66v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-435/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/=
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">TIMEOUT</a> +=
1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@xe_live=
_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-1/igt@xe_=
live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests =
fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-6/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fa=
il</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-435/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/igt@x=
e_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other test=
s fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-5/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-8/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fa=
il</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152266v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@core_hotunplug@hotrebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@device_r=
eset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@device_reset@unbind-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5547">Intel XE#5547</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@fbdev@pa=
n.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152266v1/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_big_=
fb@x-tiled-addfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sha=
rd-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-3/igt@kms_flip@basic-fli=
p-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_lease@invalid-create-le=
ases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-432/igt@kms_pl=
ane_cursor@overlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@kms_plane_cursor@overlay=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_rpm@modes=
et-stress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_prop=
erties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_proper=
ties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +79 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-2/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-vm-d=
estroy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_eudebug@connect-user.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@pr=
ocess-many-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +27 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-3/igt@xe_pm@s=
2idle-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-e=
xecs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +13 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-bmg-6/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-dg2-435/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@x=
e_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +398 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@core_hot=
unplug@hotunbind-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@core_ho=
tunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@core_set=
master@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@core_setmast=
er@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@fbdev@un=
aligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@fbdev@unaligned-w=
rite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_addf=
b_basic@bad-pitch-999.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_addfb=
_basic@bad-pitch-999.html">PASS</a> +62 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_add=
fb_basic@legacy-format.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-2/igt@kms_addfb_basic=
@legacy-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_b=
ig_fb@linear-8bpp-rotate-180.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-=
adlp-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-4=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-=
1/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mod=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-2/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-dg2-433/igt@xe=
_exec_basic@multigpu-once-null.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
66v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-free-nome=
mset.html">PASS</a> +318 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152266v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_=
fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms=
_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-=
bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152266v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sh=
ard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_bw@l=
inear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/=
igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-=
3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_ccs@=
crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@k=
ms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bm=
g-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-152266v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_cham=
elium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms=
_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shar=
d-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">In=
tel XE#4950</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@kms_ch=
amelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-d=
g2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/=
shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v=
1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152266v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-6=
4bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">I=
ntel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
266v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152266v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
66v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2266v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
266v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bm=
g-4/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-adlp-6/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152266v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266=
v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shar=
d-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sh=
ard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489=
">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-4/igt@kms_=
psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5=
/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sha=
rd-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-=
4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg=
-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#495=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bm=
g-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sha=
rd-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/sha=
rd-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@kms_vrr@flip-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE=
#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152266v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_eudeb=
ug@read-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_eudebug@rea=
d-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5515">Int=
el XE#5515</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152266v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer=
-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
266v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v=
1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">=
Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152266v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-binde=
xecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152266v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-v=
m-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-dg2-466/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-new-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel X=
E#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152266v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-stride-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_exec_=
system_allocator@twice-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/ig=
t@xe_exec_system_allocator@twice-mmap-huge.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +23=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/s=
hard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1=
/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-3/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_pm@s3-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_pmu@a=
ll-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_p=
mu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-3/igt@xe_pxp@d=
isplay-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_pxp@display-px=
p-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_pxp@p=
xp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-8=
/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_query=
@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_q=
uery@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_query=
@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-7/i=
gt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52266v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-8/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#=
4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152266v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-=
reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/shard-bmg-1/igt@xe_sriov=
_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/shard-bmg-5/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741 -&gt; xe-pw-152=
266v1</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741: 9378b693d04cb60c6d1b131=
50244c480a7cd2741<br />
  xe-pw-152266v1: 152266v1</p>

</body>
</html>

--===============6494849764293951215==--
