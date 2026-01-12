Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76C2C9EC90
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 13:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5147D10E3CB;
	Mon, 12 Jan 2026 13:27:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618C10E3C9;
 Mon, 12 Jan 2026 13:27:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3939983826600005895=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_MAINTAINERS=3A_drm=3A_add_?=
 =?utf-8?q?maintainers_for_DRM_buddy_allocator_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jan 2026 13:27:26 -0000
Message-ID: <176822444666.145871.15334956047102410082@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260112114022.315139-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260112114022.315139-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============3939983826600005895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: MAINTAINERS: drm: add maintainers for DRM buddy allocator (rev2)
URL   : https://patchwork.freedesktop.org/series/159940/
State : failure

== Summary ==

CI Bug Log - changes from xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e_FULL -> xe-pw-159940v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159940v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159940v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159940v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@query-forked@pipe-d-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_vblank@query-forked@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_vblank@query-forked@pipe-d-dp-2.html

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2}:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-159940v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#6779])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6779]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#7009])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#4674])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@fbdev@eof.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@fbdev@eof.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2134])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#5177] / [Intel XE#6703])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#5177] / [Intel XE#6703])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2370])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3428] / [Intel XE#5254]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2328]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#610]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +24 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +22 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +33 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +25 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2390] / [Intel XE#6974]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6974]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#3304]) +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#6707]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2291]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2286])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-3:
    - shard-bmg:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#5254])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-3.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4210])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1508])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1340])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4354])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4331])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2244])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4422])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4156])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#776])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2372])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2374])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#5352]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][57] ([Intel XE#3428]) +1 other test dmesg-fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#3149] / [Intel XE#3650] / [Intel XE#6266]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#6266]) +2 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3650] / [Intel XE#6266])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2316])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [FAIL][65] ([Intel XE#3149] / [Intel XE#3650] / [Intel XE#5352] / [Intel XE#6266])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#6266]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#3650] / [Intel XE#6266]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#3149] / [Intel XE#3650] / [Intel XE#6266])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293] / [Intel XE#2380]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +8 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2380]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +75 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +35 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +70 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2352])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2312]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#3544])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][78] ([Intel XE#6740]) +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6901]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6911])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2486])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6557] / [Intel XE#6703]) +16 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2393])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#5020])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6886]) +24 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#870]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#3309])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2505])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2499])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1439] / [Intel XE#836])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#6693]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#6693]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_pm_rpm@universal-planes-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#1489]) +18 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#2387])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#6703]) +28 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +34 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2330])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1435]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#6503]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2168]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1499]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#2142]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#6599]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4837]) +20 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#6665] / [Intel XE#6681])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4837] / [Intel XE#6665]) +12 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#5793]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][112] ([Intel XE#6321])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#6557] / [Intel XE#6703]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#6703]) +1067 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2322]) +19 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#6874]) +73 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#6703]) +558 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#3428]) +7 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][122] ([Intel XE#6480])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4943]) +58 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#6281])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][125] ([Intel XE#5466])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2229])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2833])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_mmap@system:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][128] ([Intel XE#3428]) +13 other tests dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_mmap@system.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141]) -> ([PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [SKIP][165], [PASS][166], [PASS][167]) ([Intel XE#2457])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][168] -> [FAIL][169] ([Intel XE#6913])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#6964]) +14 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2248])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1420])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2236])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2427] / [Intel XE#6953])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#5694])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2284]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][177] ([Intel XE#3428] / [Intel XE#4504])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#579])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#4733]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#944]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][181] ([Intel XE#6569])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:
    - shard-bmg:          [ABORT][182] ([Intel XE#6740]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][184] ([Intel XE#6740] / [Intel XE#6976]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@testdisplay.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@testdisplay.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][186] ([Intel XE#7024]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-1/igt@xe_pm@s4-exec-after.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-1/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][188] ([Intel XE#2327]) -> [SKIP][189] ([Intel XE#6703]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][190] ([Intel XE#1124]) -> [SKIP][191] ([Intel XE#6703]) +8 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][192] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][193] ([Intel XE#6703])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][194] ([Intel XE#367]) -> [SKIP][195] ([Intel XE#6703]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][196] ([Intel XE#3432]) -> [SKIP][197] ([Intel XE#6703])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][198] ([Intel XE#2887]) -> [SKIP][199] ([Intel XE#6703]) +12 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][200] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][201] ([Intel XE#6703])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][202] ([Intel XE#2724]) -> [SKIP][203] ([Intel XE#6703])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cdclk@plane-scaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][204] ([Intel XE#2325]) -> [SKIP][205] ([Intel XE#6703]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          [SKIP][206] ([Intel XE#2252]) -> [SKIP][207] ([Intel XE#6703]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][208] ([Intel XE#6969]) -> [SKIP][209] ([Intel XE#6969] / [Intel XE#7006])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only.html
    - shard-bmg:          [SKIP][210] ([Intel XE#6969]) -> [SKIP][211] ([Intel XE#6703])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][212] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][213] ([Intel XE#6703])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_content_protection@atomic-dpms.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][214] ([Intel XE#307]) -> [SKIP][215] ([Intel XE#307] / [Intel XE#6974]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][216] ([Intel XE#6707]) -> [SKIP][217] ([Intel XE#6703])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_content_protection@uevent-hdcp14.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][218] ([Intel XE#2320]) -> [SKIP][219] ([Intel XE#6703]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][220] ([Intel XE#2320]) -> [SKIP][221] ([Intel XE#6557] / [Intel XE#6703])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][222] ([Intel XE#4633]) -> [SKIP][223] ([Intel XE#6703])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][224] ([Intel XE#2286]) -> [SKIP][225] ([Intel XE#6703])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][226] ([Intel XE#2244]) -> [SKIP][227] ([Intel XE#6703]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][228] ([Intel XE#2374]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][230] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][231] ([Intel XE#6703]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][232] ([Intel XE#2311]) -> [SKIP][233] ([Intel XE#2312]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][234] ([Intel XE#2311]) -> [SKIP][235] ([Intel XE#6703]) +20 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][236] ([Intel XE#4141]) -> [SKIP][237] ([Intel XE#6703]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][238] ([Intel XE#2313]) -> [SKIP][239] ([Intel XE#2312]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][240] ([Intel XE#2350]) -> [SKIP][241] ([Intel XE#6703])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#2313]) -> [SKIP][243] ([Intel XE#6703]) +29 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [ABORT][244] ([Intel XE#6740]) -> [SKIP][245] ([Intel XE#6703]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][246] ([Intel XE#4298]) -> [SKIP][247] ([Intel XE#6703])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][248] ([Intel XE#4329] / [Intel XE#6912]) -> [SKIP][249] ([Intel XE#6703])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][250] ([Intel XE#2393]) -> [SKIP][251] ([Intel XE#6703])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][252] ([Intel XE#870]) -> [SKIP][253] ([Intel XE#6703]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][254] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][255] ([Intel XE#6693]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][256] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][257] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][258] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][259] ([Intel XE#1406] / [Intel XE#6703]) +13 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][260] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][261] ([Intel XE#6703]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][262] ([Intel XE#6503]) -> [SKIP][263] ([Intel XE#6703]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_sharpness_filter@filter-rotations.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_sharpness_filter@filter-rotations.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][264] ([Intel XE#6599]) -> [SKIP][265] ([Intel XE#6703])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][266] ([Intel XE#4837]) -> [SKIP][267] ([Intel XE#6703]) +8 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          [SKIP][268] ([Intel XE#6665]) -> [SKIP][269] ([Intel XE#6703])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_eudebug_online@pagefault-one-of-many.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][270] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][271] ([Intel XE#6703])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][272] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][273] ([Intel XE#6703]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][274] ([Intel XE#2322]) -> [SKIP][275] ([Intel XE#6703]) +6 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          [SKIP][276] ([Intel XE#6874]) -> [SKIP][277] ([Intel XE#6703]) +28 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][278] ([Intel XE#5007]) -> [SKIP][279] ([Intel XE#6703])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-free-huge:
    - shard-bmg:          [SKIP][280] ([Intel XE#4943]) -> [SKIP][281] ([Intel XE#6703]) +18 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec_system_allocator@twice-mmap-free-huge.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-free-huge.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][282] ([Intel XE#2245]) -> [SKIP][283] ([Intel XE#6703])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][284] ([Intel XE#2284]) -> [SKIP][285] ([Intel XE#6703])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_pm@d3cold-basic.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          [SKIP][286] ([Intel XE#4733]) -> [SKIP][287] ([Intel XE#6703])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][288] ([Intel XE#944]) -> [SKIP][289] ([Intel XE#6703]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][290] ([Intel XE#6569]) -> [SKIP][291] ([Intel XE#6703])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5254
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#6976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6976
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7009
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e -> xe-pw-159940v2

  IGT_8696: 8696
  xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e: f339d0352f5f7e023e8ff89bb18291df8dfdad6e
  xe-pw-159940v2: 159940v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/index.html

--===============3939983826600005895==
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
<tr><td><b>Series:</b></td><td>MAINTAINERS: drm: add maintainers for DRM bu=
ddy allocator (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159940/">https://patchwork.freedesktop.org/series/159940/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159940v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159940v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4365-f339d0352f5f7e023e8ff89bb18291df8=
dfdad6e_FULL -&gt; xe-pw-159940v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159940v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159940v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1599=
40v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@query-forked@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_vbla=
nk@query-forked@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_vblank@query-=
forked@pipe-d-dp-2.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-sys-benchmark:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_=
system_allocator@prefetch-sys-benchmark.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_ex=
ec_system_allocator@prefetch-sys-benchmark.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2}:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_colo=
r_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms=
_color_pipeline@plane-lut1d-ctm3x4@pipe-d-dp-2.html">FAIL</a> +2 other test=
s fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159940v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_hotunplug@hotunbind-rebi=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6779">Intel XE#6779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7009">Intel XE#7009</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@core_setmaster@master-drop-se=
t-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@fbdev@eo=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159940v2/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@fbdev@unaligned-read.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134=
">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@intel_h=
wmon@hwmon-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5177">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_big_=
fb@x-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_big_fb@x-tiled-=
16bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5254">Intel XE#5254</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +24 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +5 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_dirt=
yfb@default-dirtyfb-ioctl@a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_dirt=
yfb@default-dirtyfb-ioctl@a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5254">Intel XE#5254</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other =
test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_=
vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3650">Intel XE#3650</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-wf_vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3650">Intel XE#3650</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3650">Intel XE#3650</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +75 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +35 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +70 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hd=
mi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pipe_crc_basic@disable-cr=
c-after-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +16 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +24 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505=
">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/669=
3">Intel XE#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_pm_=
rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_rpm@universa=
l-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6693">Intel XE#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +18 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@kms_psr@psr-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +34 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-8/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-5/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_compute@eu-busy-10s.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_eudebug_online@pagefault-w=
rite-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6665">Intel XE#6665</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6665">Intel XE#6665</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-thr=
eads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec=
_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@x=
e_exec_balancer@many-execqueues-cm-virtual-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqu=
eue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +1067 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_exec_=
system_allocator@many-free-race-nomemset.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_e=
xec_system_allocator@many-free-race-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
558 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_=
system_allocator@many-large-execqueues-malloc-race.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-=
6/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3428">Intel XE#3428</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_exec_system_allocator@man=
y-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_mmap@system.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428=
">Intel XE#3428</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6=
e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291df8df=
dad6e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18291d=
f8dfdad6e/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff89bb18=
291df8dfdad6e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e023e8ff=
89bb18291df8dfdad6e/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f7e02=
3e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4365-f339d0352f5f=
7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@xe_module_load@load.html">PASS=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
940v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
940v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
940v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159940v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159940v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-=
bmg-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159940v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_module_load@reloa=
d-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6913">Intel XE#6913</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-concurr=
ent-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-a=
ll.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3428">Intel XE#3428</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159940v2/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolati=
on.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_hdr@=
static-toggle-dpms@pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/i=
gt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html">PASS</a> +3 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@testdisp=
lay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6976">Intel XE#6976</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-10/igt@testdisplay=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-1/igt@xe_pm@s4=
-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7024">Intel XE#7024</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-1/igt@xe_pm@s4-exec=
-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_big=
_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_=
big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_bw@=
connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel=
 XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-159940v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shar=
d-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/sha=
rd-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cdc=
lk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cdclk@plan=
e-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_ch=
amelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_cham=
elium_edid@dp-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cha=
melium_edid@dp-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-1/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-1/i=
gt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel =
XE#7006</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/i=
gt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_con=
tent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard=
-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-lnl-7/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-lnl-8/igt@kms_=
content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_con=
tent_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@k=
ms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_curs=
or_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5=
/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cur=
sor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_dsc=
@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_dsc@d=
sc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
40v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
40v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
40v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159940v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
40v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_hdr@=
static-toggle-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@kms_pip=
e_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/s=
hard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-9/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bm=
g-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159940v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@kms_psr@=
fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#285=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
940v2/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
40v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@kms_shar=
pness_filter@filter-rotations.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@k=
ms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_compu=
te@ccs-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_compute@cc=
s-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_e=
udebug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_eudeb=
ug_online@pagefault-one-of-many.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/ig=
t@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-3/igt@xe_eudeb=
ug_online@pagefault-read-stress.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/s=
hard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_eudeb=
ug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665"=
>Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb=
-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159940v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec=
_multi_queue@max-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2=
/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_exec_=
system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v=
2/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_exec=
_system_allocator@twice-mmap-free-huge.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bm=
g-5/igt@xe_exec_system_allocator@twice-mmap-free-huge.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_pm@d=
3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_pm@d3cold-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-1/igt@xe_pxp@p=
xp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/=
igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-10/igt@xe_quer=
y@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-=
bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e/shard-bmg-2/igt@xe_sriov=
_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159940v2/shard-bmg-5/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e -&gt; xe-pw-159=
940v2</li>
</ul>
<p>IGT_8696: 8696<br />
  xe-4365-f339d0352f5f7e023e8ff89bb18291df8dfdad6e: f339d0352f5f7e023e8ff89=
bb18291df8dfdad6e<br />
  xe-pw-159940v2: 159940v2</p>

</body>
</html>

--===============3939983826600005895==--
