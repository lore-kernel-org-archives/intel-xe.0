Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8248FC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 22:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B5210E2EE;
	Tue,  1 Jul 2025 22:11:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB23C10E679;
 Tue,  1 Jul 2025 22:11:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8207502523233003249=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/tests=3A_Add_legacy?=
 =?utf-8?q?_IP_descriptors_to_param_generators?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 22:11:06 -0000
Message-ID: <175140786694.126241.7429975888018584817@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250627181110.1436-1-michal.wajdeczko@intel.com>
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

--===============8207502523233003249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/tests: Add legacy IP descriptors to param generators
URL   : https://patchwork.freedesktop.org/series/150895/
State : failure

== Summary ==

CI Bug Log - changes from xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f_FULL -> xe-pw-150895v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150895v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150895v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150895v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-150895v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3] ([Intel XE#3908])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#3658])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2191])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2351] / [Intel XE#4208])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +195 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#306])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#306])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#373])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_cursor_legacy@forked-move.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#1340])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#3009])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_dp_aux_dev.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#776])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2316]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#886]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#2882] / [Intel XE#5338]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@a-dp2.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4208] / [i915#2575]) +25 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#4543]) +3 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-2/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-3/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2049] / [Intel XE#2597])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2293] / [Intel XE#2380])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#1874])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][53] -> [DMESG-FAIL][54] ([Intel XE#4543]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#352])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2312]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2313])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4141])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#653]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2925])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2763]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#870])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#718])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2893] / [Intel XE#4608])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4608]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1489]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4609])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2234] / [Intel XE#2850])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2414])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#3414])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#3414] / [Intel XE#3904])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#455]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1499])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4837]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#4837]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1392]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1392])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#4812])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4943]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4915]) +33 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-stride-mmap-shared.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#4208]) +10 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#560])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119]) -> ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [SKIP][142], [PASS][143], [PASS][144], [PASS][145]) ([Intel XE#378])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-466/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-466/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-466/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2541] / [Intel XE#3573])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4208]) +109 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][148] -> [DMESG-WARN][149] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#944])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4130])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4273])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][153] ([Intel XE#4543]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][155] ([Intel XE#2291]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][157] ([Intel XE#4354]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][159] ([Intel XE#2316]) -> [PASS][160] +6 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#4543]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#301]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][166] +2 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][167] ([Intel XE#1503]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][169] ([Intel XE#3012]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][171] ([Intel XE#4596]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][173] ([Intel XE#1435]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1392]) -> [PASS][176] +6 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][177] ([Intel XE#4543]) -> [DMESG-FAIL][178] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_async_flips@crc-atomic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][179] ([Intel XE#3884]) -> [DMESG-FAIL][180] ([Intel XE#4543])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#316]) -> [SKIP][182] ([Intel XE#2351] / [Intel XE#4208])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][184] ([Intel XE#4208])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][185] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][186] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][188] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][189] ([Intel XE#2341]) -> [FAIL][190] ([Intel XE#1178])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_content_protection@legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][191] ([Intel XE#1178]) -> [SKIP][192] ([Intel XE#2341])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_content_protection@srm.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][193] ([Intel XE#1188]) -> [SKIP][194] ([Intel XE#2341])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_content_protection@uevent.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4354]) -> [SKIP][196] ([Intel XE#4208])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][197] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][198] ([Intel XE#2316])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [SKIP][200] ([Intel XE#2311]) +13 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#2312]) -> [SKIP][202] ([Intel XE#4141]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#4141]) -> [SKIP][204] ([Intel XE#2312]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][205] ([Intel XE#2311]) -> [SKIP][206] ([Intel XE#2312]) +8 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][207] ([Intel XE#2313]) -> [SKIP][208] ([Intel XE#2312]) +8 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2313]) +17 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#653]) -> [SKIP][212] ([Intel XE#4208]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2-set2:     [INCOMPLETE][213] -> [SKIP][214] ([Intel XE#4208] / [i915#2575])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_hdr@bpc-switch.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][215] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][216] ([Intel XE#3544])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][217] ([Intel XE#5021]) -> [SKIP][218] ([Intel XE#4596])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][220] ([Intel XE#2351] / [Intel XE#4208])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_psr@fbc-pr-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][221] ([Intel XE#2426]) -> [FAIL][222] ([Intel XE#1729])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][223] ([Intel XE#2509]) -> [SKIP][224] ([Intel XE#2426])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][225] ([Intel XE#5018]) -> [FAIL][226] ([Intel XE#4937])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4915]) -> [SKIP][228] ([Intel XE#4208]) +15 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][229] ([Intel XE#1173]) -> [SKIP][230] ([Intel XE#1061])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_peer2peer@read.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#944]) -> [SKIP][232] ([Intel XE#4208])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f -> xe-pw-150895v1

  IGT_8431: 8431
  xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f: f286b243950bff50335f38f30ee72e82cb33c60f
  xe-pw-150895v1: 150895v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/index.html

--===============8207502523233003249==
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
<tr><td><b>Series:</b></td><td>drm/xe/tests: Add legacy IP descriptors to p=
aram generators</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150895/">https://patchwork.freedesktop.org/series/150895/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150895v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150895v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3324-f286b243950bff50335f38f30ee72e82c=
b33c60f_FULL -&gt; xe-pw-150895v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150895v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150895v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1508=
95v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-m=
ap-nomemset:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150895v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-e=
xecqueues-new-bo-map-nomemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150895v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_atomic_transition@plane=
-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_=
ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_chamelium_color@ctm-max=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_cu=
rsor_legacy@forked-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_cursor_legacy@f=
orked-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_flip=
@blocking-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_flip@blocking-w=
f_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_flip@flip-vs-absolute-w=
f_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +25 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-3/igt@kms_flip@flip-vs-rm=
fb@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-4/igt@kms_=
flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"=
>Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_force_connector_basic@for=
ce-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane=
-move@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_psr@pr-cursor-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
4">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_eudebug@discovery-race-s=
igint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-6/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-9/igt@xe_exec_reset@gt-rese=
t-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4812">Intel XE#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-1/igt@xe_exec_system_allocator@once=
-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +33 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_exe=
c_threads@threads-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2=
-463/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb=
33c60f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee7=
2e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f3=
8f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff5=
0335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b2439=
50bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f28=
6b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
24-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33=
c60f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e=
82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f3=
0ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff5033=
5f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950b=
ff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b2=
43950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-=
f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50895v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150895v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2=
-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150895v1/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150895v1/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_pm@s2idle-exec-after.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +8 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_sriov_flr@flr-twice.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard=
-adlp-2/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150895v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@km=
s_flip@2x-plain-flip-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-3/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150895v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupti=
ble@c-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_f=
lip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
95v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-3/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-7/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-=
dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-2/igt@kms_=
async_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-adlp-=
2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@k=
ms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/sha=
rd-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150895v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-8/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#25=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0895v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">=
Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v=
1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
95v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
95v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50895v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
95v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
95v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_hd=
r@bpc-switch.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@kms_hdr@bpc-switch.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@kms_ps=
r@fbc-pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463/igt@=
kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#=
4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915"=
>Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150895v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-share=
d-vm-many-large-mmap-shared-remap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-464/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-dg2-433/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-dg2-463=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f -&gt; xe-pw-150=
895v1</li>
</ul>
<p>IGT_8431: 8431<br />
  xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f: f286b243950bff50335f38f=
30ee72e82cb33c60f<br />
  xe-pw-150895v1: 150895v1</p>

</body>
</html>

--===============8207502523233003249==--
