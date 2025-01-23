Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B6C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 06:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8410E277;
	Thu, 23 Jan 2025 06:14:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DCD10E277;
 Thu, 23 Jan 2025 06:14:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4829465239509533551=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_HDMI_PLL_Algorithm_for?=
 =?utf-8?q?_SNPS/C10PHY_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 06:14:38 -0000
Message-ID: <173761287894.3414743.18294366551055084004@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
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

--===============4829465239509533551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev6)
URL   : https://patchwork.freedesktop.org/series/135396/
State : failure

== Summary ==

CI Bug Log - changes from xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a_full -> xe-pw-135396v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135396v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135396v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135396v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@core_hotunplug@unplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-4/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10] +2 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [DMESG-WARN][13] ([Intel XE#1033]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html

  
Known issues
------------

  Here are the changes found in xe-pw-135396v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#827]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1033])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2370])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2328])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#619])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2191]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +146 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#314]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#314]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][43] ([Intel XE#1033]) +12 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2341])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][45] ([Intel XE#1033]) +3 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#308]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][50] ([Intel XE#3226])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#877]) +1 other test dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2244]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2244])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1421]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][58] ([Intel XE#2955])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#886]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#301]) +2 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3321]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][64] -> [ABORT][65] ([Intel XE#2625])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#3664])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][68] ([Intel XE#2625])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293] / [Intel XE#2380])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1397] / [Intel XE#1745])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1397])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#651]) +20 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4141]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#651]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#656]) +16 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2313]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653]) +21 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2136]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#346])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#346])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2927])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2934])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2486])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#1033]) +16 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1033]) +5 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-7efc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2763]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2763]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2893]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1489]) +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1406])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2330])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1127])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1127])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#3414]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#1729])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][107] ([Intel XE#899]) +3 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2168])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][109] ([Intel XE#1522]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +12 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1499])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][112] -> [DMESG-WARN][113] ([Intel XE#2705])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@testdisplay.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1126]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3889])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#3889])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2905]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2905]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2905]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-large-external:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][121] ([Intel XE#1033] / [Intel XE#1473]) +1 other test dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#1392]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2322]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1392]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#288]) +19 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][128] -> [DMESG-WARN][129] ([Intel XE#3876])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#584]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#1192])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1192])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#1999]) +2 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#977])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2284])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          [PASS][138] -> [DMESG-WARN][139] ([Intel XE#1033] / [Intel XE#1616])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][140] -> [ABORT][141] ([Intel XE#1358] / [Intel XE#1794])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@xe_pm@s3-mocs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][142] ([Intel XE#1033] / [Intel XE#569])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][143] -> [ABORT][144] ([Intel XE#1358] / [Intel XE#1607])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-2/igt@xe_pm@s4-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][145] -> [ABORT][146] ([Intel XE#1358] / [Intel XE#1607])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][147] ([Intel XE#1033] / [Intel XE#2280])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][148] -> [ABORT][149] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][150] ([Intel XE#1033]) +54 other tests dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#944])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_vm@mmap-style-bind-many-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1130]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_vm@mmap-style-bind-many-all.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear:
    - shard-lnl:          [FAIL][153] ([Intel XE#911]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#367]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#3862]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1727]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][165] ([Intel XE#1616]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][167] ([Intel XE#3098] / [Intel XE#4072]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [INCOMPLETE][171] ([Intel XE#2049]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][175] ([Intel XE#2955]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][177] ([Intel XE#3321]) -> [PASS][178] +5 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][179] ([i915#5274]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-bmg:          [DMESG-FAIL][181] ([Intel XE#1033]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][183] ([Intel XE#1033]) -> [PASS][184] +6 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [DMESG-WARN][185] ([Intel XE#1033]) -> [PASS][186] +33 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1392]) -> [PASS][188] +2 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [INCOMPLETE][189] ([Intel XE#3592]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][191] ([Intel XE#1358]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][193] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][195] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-2/igt@xe_pm@s4-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [INCOMPLETE][197] -> [PASS][198] +3 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][199] ([Intel XE#1033]) -> [FAIL][200] ([Intel XE#3884])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][201] -> [DMESG-WARN][202] ([Intel XE#1033])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#3226]) -> [DMESG-WARN][204] ([Intel XE#1033])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#1033]) -> [DMESG-FAIL][206] ([Intel XE#1033])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][207] ([Intel XE#1033]) -> [DMESG-WARN][208] ([Intel XE#1033])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][209] ([Intel XE#2955]) -> [DMESG-WARN][210] ([Intel XE#1033]) +1 other test dmesg-warn
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#2597]) -> [DMESG-WARN][212] ([Intel XE#2955])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#2597]) -> [DMESG-WARN][214] ([Intel XE#1033])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][215] -> [DMESG-WARN][216] ([Intel XE#1033])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#2597]) -> [DMESG-WARN][218] ([Intel XE#1033])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1500]) -> [SKIP][220] ([Intel XE#362])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][221] ([Intel XE#1033]) -> [ABORT][222] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4057]) +1 other test abort
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][223] ([Intel XE#1033] / [Intel XE#1358]) -> [DMESG-WARN][224] ([Intel XE#1033] / [Intel XE#569])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4072
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a -> xe-pw-135396v6

  IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a: 6834acba715b85cbecfeb660b9695806e98c9a0a
  xe-pw-135396v6: 135396v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/index.html

--===============4829465239509533551==
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
<tr><td><b>Series:</b></td><td>Add HDMI PLL Algorithm for SNPS/C10PHY (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135396/">https://patchwork.freedesktop.org/series/135396/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a_full -&gt; xe-pw-135396v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135396v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135396v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135396v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-4/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_content_protection@srm.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135396v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-8/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_flip@flip-vs-suspend@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664">Intel XE#3664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-7efc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-7efc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_evict@evict-large-external.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +54 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_vm@mmap-style-bind-many-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4072">Intel XE#4072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592">Intel XE#3592</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-7/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-5/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a -&gt; xe-pw-135396v6</li>
</ul>
<p>IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2532-6834acba715b85cbecfeb660b9695806e98c9a0a: 6834acba715b85cbecfeb660b9695806e98c9a0a<br />
  xe-pw-135396v6: 135396v6</p>

</body>
</html>

--===============4829465239509533551==--
