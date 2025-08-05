Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2DBC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 11:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D6410E655;
	Tue,  5 Aug 2025 11:31:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03FF10E655;
 Tue,  5 Aug 2025 11:31:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3441477529469127938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Defer_buffer_obj?=
 =?utf-8?q?ect_shrinker_write-backs_and_GPU_waits_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 11:31:14 -0000
Message-ID: <175439347470.213103.6010143049953075195@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
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

--===============3441477529469127938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Defer buffer object shrinker write-backs and GPU waits (rev2)
URL   : https://patchwork.freedesktop.org/series/152477/
State : failure

== Summary ==

CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b_FULL -> xe-pw-152477v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152477v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152477v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152477v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - shard-lnl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

  
Known issues
------------

  Here are the changes found in xe-pw-152477v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#4672])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@core_getversion@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#5715])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#4674])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@pan:
    - shard-adlp:         [PASS][9] -> [SKIP][10] ([Intel XE#2134] / [Intel XE#5567])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@fbdev@pan.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@fbdev@pan.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@fbdev@unaligned-write.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#5177])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2233])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#873])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4947]) +50 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#4947]) +16 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][22] -> [SKIP][23] ([Intel XE#4947]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +146 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2907])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#4543])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4417]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#1178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1188])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2320])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-adlp:         [PASS][45] -> [SKIP][46] ([Intel XE#4950]) +10 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#323])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#4354])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#4331])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1135])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#310])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#4950]) +71 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2316]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#4543]) +6 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2293])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2380])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][63] -> [DMESG-FAIL][64] ([Intel XE#4543])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2311])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +14 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#5390]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2313]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#653]) +16 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#1503])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2927])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4950]) +39 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_plane_alpha_blend@coverage-7efc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-4/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#616])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2763]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2938])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#870]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#4962])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [PASS][84] -> [SKIP][85] ([Intel XE#4962])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4962])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1489]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1127]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3414])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1435]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1447] / [Intel XE#5617])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1123])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#5626])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4837]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4837])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1392]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#1392]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1392] / [Intel XE#5575])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][106] ([Intel XE#3868])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][107] -> [DMESG-WARN][108] ([Intel XE#3876])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#4915] / [Intel XE#5560]) +24 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4915]) +157 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4945]) +161 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][112] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#560])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138]) -> ([PASS][139], [PASS][140], [PASS][141], [SKIP][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164]) ([Intel XE#2457])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-8/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#3573]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2838] / [Intel XE#979])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2284] / [Intel XE#366])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#2284] / [Intel XE#366])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][169] -> [SKIP][170] ([Intel XE#4945]) +23 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
    - shard-dg2-set2:     [PASS][171] -> [INCOMPLETE][172] ([Intel XE#4504] / [Intel XE#5382])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#579])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4733])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#944]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4821])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#4130])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#4130])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][179] -> [SKIP][180] ([Intel XE#4945]) +364 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][181] ([Intel XE#4963]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][183] ([Intel XE#2134]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@info.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][185] ([Intel XE#911]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][187] ([Intel XE#4947]) -> [PASS][188] +15 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][189] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#3862]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#3124]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][197] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][199] ([Intel XE#2291]) -> [PASS][200] +3 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][201] ([Intel XE#4950]) -> [PASS][202] +74 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][203] ([Intel XE#2316]) -> [PASS][204] +3 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][205] ([Intel XE#301]) -> [PASS][206] +2 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][207] ([Intel XE#4543]) -> [PASS][208] +4 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          [INCOMPLETE][209] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][213] ([Intel XE#4543]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#455]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][217] ([Intel XE#1503]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@static-swap.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][219] ([Intel XE#4596]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-bmg:          [FAIL][221] ([Intel XE#5420]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_eu_stall@non-blocking-re-enable.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1392]) -> [PASS][224] +5 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [SKIP][225] ([Intel XE#4945]) -> [PASS][226] +336 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][227] ([Intel XE#5018]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [DMESG-WARN][229] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s4-basic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-3/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][231] ([Intel XE#4665]) -> [SKIP][232] ([Intel XE#5177])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][233] ([Intel XE#4950]) -> [SKIP][234] ([Intel XE#873])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][235] ([Intel XE#1124]) -> [SKIP][236] ([Intel XE#4947]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][237] ([Intel XE#4947]) -> [SKIP][238] ([Intel XE#2327]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][239] ([Intel XE#2327]) -> [SKIP][240] ([Intel XE#4947]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][241] ([Intel XE#4947]) -> [SKIP][242] ([Intel XE#1124]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         [SKIP][243] ([Intel XE#316]) -> [SKIP][244] ([Intel XE#4947])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][245] ([Intel XE#1124]) -> [SKIP][246] ([Intel XE#4947]) +9 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][247] ([Intel XE#2328]) -> [SKIP][248] ([Intel XE#4947])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][249] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][250] ([Intel XE#4950])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][251] ([Intel XE#4950]) -> [SKIP][252] ([Intel XE#2314] / [Intel XE#2894])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][253] ([Intel XE#4950]) -> [SKIP][254] ([Intel XE#367]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][255] ([Intel XE#367]) -> [SKIP][256] ([Intel XE#4950]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         [SKIP][257] ([Intel XE#367]) -> [SKIP][258] ([Intel XE#4950])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][259] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][260] ([Intel XE#2351] / [Intel XE#4947]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][261] ([Intel XE#2887]) -> [SKIP][262] ([Intel XE#4947]) +11 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][263] ([Intel XE#3862]) -> [SKIP][264] ([Intel XE#4947])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][265] ([Intel XE#3432]) -> [SKIP][266] ([Intel XE#4947]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][267] ([Intel XE#4947]) -> [SKIP][268] ([Intel XE#3432]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [ABORT][270] ([Intel XE#2705])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][271] ([Intel XE#4947]) -> [SKIP][272] ([Intel XE#2887]) +9 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][273] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][274] ([Intel XE#4947]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][275] ([Intel XE#4947]) -> [SKIP][276] ([Intel XE#2724])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][277] ([Intel XE#4950]) -> [SKIP][278] ([Intel XE#2252]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         [SKIP][279] ([Intel XE#306]) -> [SKIP][280] ([Intel XE#4950])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_chamelium_color@ctm-blue-to-red.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][281] ([Intel XE#2325]) -> [SKIP][282] ([Intel XE#4950])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][283] ([Intel XE#4950]) -> [SKIP][284] ([Intel XE#2325])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][285] ([Intel XE#2252]) -> [SKIP][286] ([Intel XE#4950]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         [SKIP][287] ([Intel XE#373]) -> [SKIP][288] ([Intel XE#4950]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][289] ([Intel XE#1178]) -> [SKIP][290] ([Intel XE#4950])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_content_protection@atomic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][291] ([Intel XE#4950]) -> [FAIL][292] ([Intel XE#1178])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][293] ([Intel XE#2390]) -> [SKIP][294] ([Intel XE#4950])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][295] ([Intel XE#4950]) -> [SKIP][296] ([Intel XE#2390])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][297] ([Intel XE#2341]) -> [SKIP][298] ([Intel XE#4950])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][299] ([Intel XE#2320]) -> [SKIP][300] ([Intel XE#4950]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][301] ([Intel XE#2321]) -> [SKIP][302] ([Intel XE#4950])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][303] ([Intel XE#4950]) -> [SKIP][304] ([Intel XE#2320]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][305] ([Intel XE#4354]) -> [SKIP][306] ([Intel XE#4947])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][307] ([Intel XE#4947]) -> [SKIP][308] ([Intel XE#4331])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][309] ([Intel XE#2244]) -> [SKIP][310] ([Intel XE#4947]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         [SKIP][311] ([Intel XE#4422]) -> [SKIP][312] ([Intel XE#4945])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][313] ([Intel XE#4422]) -> [SKIP][314] ([Intel XE#4945])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][315] ([Intel XE#5425]) -> [SKIP][316] ([Intel XE#4947])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][317] ([Intel XE#4947]) -> [SKIP][318] ([Intel XE#5425])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][319] ([Intel XE#776]) -> [SKIP][320] ([Intel XE#4947])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fbcon_fbt@psr.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][321] ([Intel XE#2375]) -> [SKIP][322] ([Intel XE#4950])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][323] ([Intel XE#4950]) -> [SKIP][324] ([Intel XE#2374])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         [SKIP][325] ([Intel XE#310]) -> [SKIP][326] ([Intel XE#4950])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [TIMEOUT][327] ([Intel XE#1504]) -> [TIMEOUT][328] ([Intel XE#1504] / [Intel XE#5737]) +1 other test timeout
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][329] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][330] ([Intel XE#4543])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         [SKIP][331] ([Intel XE#455]) -> [SKIP][332] ([Intel XE#4947])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][333] ([Intel XE#4947]) -> [SKIP][334] ([Intel XE#2293] / [Intel XE#2380])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][335] ([Intel XE#4947]) -> [SKIP][336] ([Intel XE#2380])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][337] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][338] ([Intel XE#4947]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][339] ([Intel XE#651]) -> [SKIP][340] ([Intel XE#4947])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][341] ([Intel XE#4947]) -> [SKIP][342] ([Intel XE#2311]) +21 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][343] ([Intel XE#2312]) -> [SKIP][344] ([Intel XE#2311]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][345] ([Intel XE#2311]) -> [SKIP][346] ([Intel XE#2312]) +5 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][347] ([Intel XE#2311]) -> [SKIP][348] ([Intel XE#4947]) +27 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][349] ([Intel XE#4947]) -> [SKIP][350] ([Intel XE#5390]) +7 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][351] ([Intel XE#5390]) -> [SKIP][352] ([Intel XE#4947]) +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][353] ([Intel XE#656]) -> [SKIP][354] ([Intel XE#2351] / [Intel XE#4947])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][355] ([Intel XE#5390]) -> [SKIP][356] ([Intel XE#2312]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][357] ([Intel XE#2312]) -> [SKIP][358] ([Intel XE#5390]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][359] ([Intel XE#651]) -> [SKIP][360] ([Intel XE#2351] / [Intel XE#4947])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][361] ([Intel XE#4947]) -> [SKIP][362] ([Intel XE#2352]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][363] ([Intel XE#2313]) -> [SKIP][364] ([Intel XE#2312]) +6 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][365] ([Intel XE#656]) -> [SKIP][366] ([Intel XE#4947]) +7 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][367] ([Intel XE#5672]) -> [SKIP][368] ([Intel XE#4947])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-adlp:         [SKIP][369] ([Intel XE#653]) -> [SKIP][370] ([Intel XE#4947]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2313]) -> [SKIP][372] ([Intel XE#4947]) +25 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][373] ([Intel XE#2312]) -> [SKIP][374] ([Intel XE#2313]) +6 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][375] ([Intel XE#4947]) -> [SKIP][376] ([Intel XE#2313]) +24 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][377] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][378] ([Intel XE#4950])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][379] ([Intel XE#4298]) -> [SKIP][380] ([Intel XE#4947])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][381] ([Intel XE#4947]) -> [SKIP][382] ([Intel XE#4090])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][383] ([Intel XE#2393]) -> [SKIP][384] ([Intel XE#4950])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         [SKIP][385] ([Intel XE#4596]) -> [SKIP][386] ([Intel XE#4950])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_plane_multiple@2x-tiling-y.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][387] ([Intel XE#5020]) -> [SKIP][388] ([Intel XE#4950])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         [SKIP][389] ([Intel XE#309]) -> [SKIP][390] ([Intel XE#4950]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][391] ([Intel XE#4950]) -> [SKIP][392] ([Intel XE#2763])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][393] ([Intel XE#870]) -> [SKIP][394] ([Intel XE#4947])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_backlight@fade.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][395] ([Intel XE#4947]) -> [SKIP][396] ([Intel XE#870])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][397] ([Intel XE#2391]) -> [SKIP][398] ([Intel XE#4947])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][399] ([Intel XE#4947]) -> [SKIP][400] ([Intel XE#2499])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][401] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][402] ([Intel XE#4962])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][403] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][404] ([Intel XE#4962]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][405] ([Intel XE#4947]) -> [SKIP][406] ([Intel XE#1489]) +5 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][407] ([Intel XE#1489]) -> [SKIP][408] ([Intel XE#4947])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][409] ([Intel XE#1489]) -> [SKIP][410] ([Intel XE#4947]) +7 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][411] ([Intel XE#4947]) -> [SKIP][412] ([Intel XE#2387])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          [SKIP][413] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][414] ([Intel XE#4947]) +13 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_psr@fbc-pr-no-drrs.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-adlp:         [SKIP][415] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][416] ([Intel XE#2351] / [Intel XE#4947])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][417] ([Intel XE#4947]) -> [SKIP][418] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-adlp:         [SKIP][419] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][420] ([Intel XE#4947]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr@fbc-psr2-cursor-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][421] ([Intel XE#4947]) -> [SKIP][422] ([Intel XE#2414])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         [SKIP][423] ([Intel XE#3414]) -> [SKIP][424] ([Intel XE#4950]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_rotation_crc@bad-pixel-format.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][425] ([Intel XE#4950]) -> [SKIP][426] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][427] ([Intel XE#4950]) -> [SKIP][428] ([Intel XE#2330])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][429] ([Intel XE#2330]) -> [SKIP][430] ([Intel XE#4950]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][431] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][432] ([Intel XE#4950])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-270.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][433] ([Intel XE#4950]) -> [SKIP][434] ([Intel XE#2413])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][435] ([Intel XE#1729]) -> [SKIP][436] ([Intel XE#362])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][437] ([Intel XE#2426]) -> [SKIP][438] ([Intel XE#4950])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][439] ([Intel XE#2168]) -> [SKIP][440] ([Intel XE#4950])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_vrr@lobf.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-adlp:         [SKIP][441] ([Intel XE#455]) -> [SKIP][442] ([Intel XE#4950]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_vrr@max-min.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][443] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][444] ([Intel XE#4950])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         [SKIP][445] ([Intel XE#1123]) -> [SKIP][446] ([Intel XE#4945])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-adlp:         [SKIP][447] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][448] ([Intel XE#4945]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_eudebug@basic-vm-access.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][449] ([Intel XE#4837]) -> [SKIP][450] ([Intel XE#4945]) +8 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][451] ([Intel XE#4945]) -> [SKIP][452] ([Intel XE#4837]) +7 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][453] ([Intel XE#4945]) -> [SKIP][454] ([Intel XE#4518])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][455] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][456] ([Intel XE#4945])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-adlp:         [SKIP][457] ([Intel XE#1392] / [Intel XE#5575]) -> [SKIP][458] ([Intel XE#4945])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][459] ([Intel XE#2322]) -> [SKIP][460] ([Intel XE#4945]) +7 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][461] ([Intel XE#4945]) -> [SKIP][462] ([Intel XE#2322]) +7 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         [SKIP][463] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][464] ([Intel XE#4945]) +3 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][465] ([Intel XE#3876]) -> [SKIP][466] ([Intel XE#4945])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][467] ([Intel XE#4943]) -> [SKIP][468] ([Intel XE#4945]) +20 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][469] ([Intel XE#4945]) -> [SKIP][470] ([Intel XE#4943]) +12 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-new-race:
    - shard-adlp:         [SKIP][471] ([Intel XE#4915] / [Intel XE#5560]) -> [SKIP][472] ([Intel XE#4945]) +48 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec_system_allocator@threads-many-new-race.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-new-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][473] ([Intel XE#4945]) -> [ABORT][474] ([Intel XE#5530])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         [SKIP][475] ([Intel XE#512]) -> [SKIP][476] ([Intel XE#4945])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_mmap@small-bar.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-adlp:         [SKIP][477] ([Intel XE#5103]) -> [SKIP][478] ([Intel XE#4945])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_oa@mmio-triggered-reports-read.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-adlp:         [SKIP][479] ([Intel XE#3573]) -> [SKIP][480] ([Intel XE#4945])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_oa@syncs-syncobj-none.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][481] ([Intel XE#4945]) -> [SKIP][482] ([Intel XE#1420])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][483] ([Intel XE#4945]) -> [SKIP][484] ([Intel XE#2245])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         [SKIP][485] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][486] ([Intel XE#4945])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_pm@d3cold-basic-exec.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][487] ([Intel XE#5694]) -> [SKIP][488] ([Intel XE#4945])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][489] ([Intel XE#4945]) -> [SKIP][490] ([Intel XE#2284])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][491] ([Intel XE#2284]) -> [SKIP][492] ([Intel XE#4945]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][493] ([Intel XE#4945]) -> [SKIP][494] ([Intel XE#4650])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [SKIP][495] ([Intel XE#4650]) -> [SKIP][496] ([Intel XE#4945])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][497] ([Intel XE#4945]) -> [SKIP][498] ([Intel XE#4733])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][499] ([Intel XE#4733]) -> [SKIP][500] ([Intel XE#4945]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][501] ([Intel XE#4945]) -> [SKIP][502] ([Intel XE#944]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][503] ([Intel XE#944]) -> [SKIP][504] ([Intel XE#4945]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         [SKIP][505] ([Intel XE#944]) -> [SKIP][506] ([Intel XE#4945])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_query@multigpu-query-mem-usage.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-adlp:         [SKIP][507] ([Intel XE#4814] / [Intel XE#5614]) -> [SKIP][508] ([Intel XE#4945])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_render_copy@render-stress-0-copies.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][509] ([Intel XE#4130]) -> [SKIP][510] ([Intel XE#4945])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][511] ([Intel XE#4945]) -> [SKIP][512] ([Intel XE#4130])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][513] ([Intel XE#4273]) -> [SKIP][514] ([Intel XE#4945])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][515] ([Intel XE#4351]) -> [SKIP][516] ([Intel XE#4945])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
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
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5382
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5567]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5567
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5617
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5715
  [Intel XE#5737]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -> xe-pw-152477v2

  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b
  xe-pw-152477v2: 152477v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/index.html

--===============3441477529469127938==
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
<tr><td><b>Series:</b></td><td>drm/xe: Defer buffer object shrinker write-b=
acks and GPU waits (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152477/">https://patchwork.freedesktop.org/series/152477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152477v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152477v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d=
1a2345b_FULL -&gt; xe-pw-152477v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152477v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152477v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1524=
77v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2=
/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues=
-new-bo-map.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152477v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672"=
>Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_setmaster@master-drop-se=
t-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5715">Intel XE#5715</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@fbdev@p=
an.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152477v2/shard-adlp-6/igt@fbdev@pan.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5567">Intel X=
E#5567</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@fbdev@un=
aligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@fbdev@unaligned-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@linear-8=
bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-a=
dlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-5=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-436/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_cur=
sor_crc@cursor-rapid-movement-64x64.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_curs=
or_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4950">Intel XE#4950</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-4/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-8/igt@kms_f=
lip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp=
-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filt=
ering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_pla=
ne_alpha_blend@coverage-7efc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-4/igt@kms_plane_alpha=
_blend@coverage-7efc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@dpms-m=
ode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_pm_=
rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_pm_rpm@modeset-l=
psp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_rpm@universal-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@kms_psr@fbc-pr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5617">Intel XE#5617</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_eudebug@multigpu-basic-c=
lient-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_eudebug_online@breakpoint-=
many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-userptr.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_exec_ba=
sic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-=
userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_fault_mode@many-inva=
lid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-remap-ro.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +2=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +161 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#55=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2=
345b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082=
d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a=
2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f=
7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601=
b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c6=
3601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415a=
e8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e=
415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79d=
fb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-=
c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4945">Intel XE#4945</a>) +23 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_pm@=
s2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152477v2/shard-dg2-464/igt@xe_pm@s2idle-basic-exec.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4504">Intel XE#4504</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5382">Intel XE#5382</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@x=
e_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +364 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hot=
unplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@core=
_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@fbdev@info.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152477v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-b=
mg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +15=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/=
shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-434/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg=
-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-1/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adl=
p-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +4 other test=
s pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sh=
ard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152477v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-436/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_eu_st=
all@non-blocking-re-enable.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-3/igt@xe_e=
u_stall@non-blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-=
dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2=
/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-malloc-race.ht=
ml">PASS</a> +336 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v2/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s=
4-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-3/igt@xe=
_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@intel_hwmon@hwm=
on-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_=
async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/=
shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_=
fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_bi=
g_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_b=
ig_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big=
_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_=
big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sh=
ard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@l=
inear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/=
igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/ig=
t@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_bw@=
linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_ccs=
@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477=
v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard=
-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg=
-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sha=
rd-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_cha=
melium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms=
_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_cham=
elium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_chameli=
um_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_cha=
melium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-ad=
lp-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_curs=
or_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_curs=
or_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-=
5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_dsc@=
dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/ig=
t@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fbc=
_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sh=
ard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945=
">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_fbcon_fbt@psr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fli=
p@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip=
@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-lnl-2=
/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737">In=
tel XE#5737</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152477v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152477v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152477v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-=
bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2=
/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/=
shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152477v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@k=
ms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477=
v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-=
bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard=
-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_plane_=
multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_pla=
ne_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@=
kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_backlight@fa=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms_=
pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard=
-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shar=
d-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr=
2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v2/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-ex=
ceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5=
/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_psr@=
fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@km=
s_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr=
@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-ad=
lp-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_psr=
@fbc-psr2-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-=
6/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sha=
rd-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_rot=
ation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms=
_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bm=
g-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-b=
mg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_rota=
tion_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shar=
d-bmg-5/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">=
Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Int=
el XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_vrr=
@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/495=
0">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shar=
d-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_copy=
_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@=
xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_eude=
bug@basic-vm-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/=
igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_eudeb=
ug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-=
bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_eudebu=
g_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_evic=
t_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">=
Intel XE#688</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152477v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-in=
stantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec=
_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/s=
hard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-=
bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec=
_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5=
561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v2/shard-adlp-6/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@x=
e_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4=
943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mm=
ap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4945">Intel XE#4945</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4943">Intel XE#4943</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_exec=
_system_allocator@threads-many-new-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#55=
60</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-new-race.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4945">Intel XE#4945</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2=
/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_mmap=
@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_oa@m=
mio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_=
oa@mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_oa@s=
yncs-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_oa@syncs-=
syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_pm@d=
3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@x=
e_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-4/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@p=
xp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-7=
/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_pxp@r=
egular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/i=
gt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-1/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_query=
@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_q=
uery@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-adlp-6/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_rend=
er_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/sh=
ard-adlp-6/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_sriov=
_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/=
igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-=
reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_sriov=
_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_sriov=
_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v2/shard-bmg-5/igt@xe=
_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -&gt; xe-pw-152=
477v2</li>
</ul>
<p>IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02=
f7b3a2082d1a2345b<br />
  xe-pw-152477v2: 152477v2</p>

</body>
</html>

--===============3441477529469127938==--
