Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90378D30008
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0CB10E914;
	Fri, 18 Oct 2024 13:22:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1811310E1A1;
 Fri, 18 Oct 2024 13:22:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5736462594606777152=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/xe2lpd=3A_Update_C20_H?=
 =?utf-8?q?DMI_TMDS_algorithm_to_include_tx=5Fmisc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 13:22:36 -0000
Message-ID: <172925775608.1282108.5883219461372986249@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017205444.102979-2-gustavo.sousa@intel.com>
In-Reply-To: <20241017205444.102979-2-gustavo.sousa@intel.com>
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

--===============5736462594606777152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc
URL   : https://patchwork.freedesktop.org/series/140135/
State : failure

== Summary ==

CI Bug Log - changes from xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203_full -> xe-pw-140135v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140135v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140135v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140135v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@kms_flip@nonexisting-fb-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-140135v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#1033] / [Intel XE#1727])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#877])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][13] ([Intel XE#1231])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1874])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2907]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#373])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#373]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#307])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#308])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#308])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#2577]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#1475]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#323])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1135])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#301]) +5 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1204])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#886]) +9 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#2049])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#651]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#1861])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#651])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#653]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#656]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#653]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#605])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2763]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#2042])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1489]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1489]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1122])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#2948]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#2939])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#327])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#362])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_vrr@flipline.html
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2443]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_vrr@flipline.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1126])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2905]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1392]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#2754])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#288]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#288]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][71] -> [TIMEOUT][72] ([Intel XE#2105])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2229])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#2541]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2541]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_oa@mi-rpc.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][76] -> [ABORT][77] ([Intel XE#1358])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][78] -> [ABORT][79] ([Intel XE#1794])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][80] -> [FAIL][81] ([Intel XE#958])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#944])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#3119])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][85] -> [PASS][86] +3 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][87] ([Intel XE#1701]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][89] ([Intel XE#1426]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#877]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][93] ([Intel XE#2436]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [FAIL][95] ([Intel XE#1475]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][97] ([Intel XE#2635]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#301]) -> [PASS][100] +13 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][101] ([Intel XE#301]) -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#2953]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][105] ([Intel XE#886]) -> [PASS][106] +3 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][107] -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][109] -> [PASS][110] +2 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-436/igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-436/igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6.html

  * igt@kms_plane@pixel-format-source-clamping:
    - {shard-bmg}:        [DMESG-WARN][111] ([Intel XE#2566] / [Intel XE#877]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
    - {shard-bmg}:        [DMESG-WARN][113] ([Intel XE#877]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][115] ([Intel XE#2948]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][117] ([Intel XE#1523]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][119] ([Intel XE#1000]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [INCOMPLETE][121] ([Intel XE#1473]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [ABORT][123] ([Intel XE#2625]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-lnl:          [DMESG-WARN][125] -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][127] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][129] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203 -> xe-pw-140135v1

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203: 08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203
  xe-pw-140135v1: 140135v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/index.html

--===============5736462594606777152==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140135/">https://patchwork.freedesktop.org/series/140135/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203_full -&gt; xe-pw-140135v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140135v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140135v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140135v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@kms_flip@nonexisting-fb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140135v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-3/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-436/igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-436/igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203 -&gt; xe-pw-140135v1</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2082-08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203: 08cd2f8911d83a3cdaa2eb2bf4e1053f9d86b203<br />
  xe-pw-140135v1: 140135v1</p>

</body>
</html>

--===============5736462594606777152==--
