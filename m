Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B19E6ADC3
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 21:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7EC10E052;
	Fri, 22 Nov 2024 21:28:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F92E10E052;
 Fri, 22 Nov 2024 21:28:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6697017682135667450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe3lpg=3A_Add_Wa=5F?=
 =?utf-8?q?16024792527_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Apoorva Singh" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 21:28:35 -0000
Message-ID: <173231091507.1837983.6826040585951936753@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241107082158.1436637-1-apoorva.singh@intel.com>
In-Reply-To: <20241107082158.1436637-1-apoorva.singh@intel.com>
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

--===============6697017682135667450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3lpg: Add Wa_16024792527 (rev7)
URL   : https://patchwork.freedesktop.org/series/140666/
State : failure

== Summary ==

CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_full -> xe-pw-140666v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140666v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140666v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140666v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][4] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_flip@flip-vs-suspend@b-dp4:
    - shard-dg2-set2:     [DMESG-FAIL][6] ([Intel XE#3468]) -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-suspend@b-dp4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][8] ([Intel XE#2333]) -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
    - shard-bmg:          [DMESG-FAIL][10] ([Intel XE#3468]) -> [DMESG-FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html

  
Known issues
------------

  Here are the changes found in xe-pw-140666v7_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#3468])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2613])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2136]) +14 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#324])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +13 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3278])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2321]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][48] ([Intel XE#3468]) +1 other test dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2423] / [i915#2575]) +30 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2286])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2425])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#3070])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2316]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#2882])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#3321] / [Intel XE#3486])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][70] -> [DMESG-WARN][71] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2136]) +17 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][73] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2380]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][80] ([Intel XE#2705] / [Intel XE#3468])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][81] ([Intel XE#1727] / [Intel XE#3468])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][82] ([Intel XE#1727]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2351])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#651]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][86] ([Intel XE#2333]) +3 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][87] ([Intel XE#3468]) +3 other tests dmesg-fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2311]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#651]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +14 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2313]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1450] / [Intel XE#2568])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1450]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#3012])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2423] / [i915#2575]) +42 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_lease@invalid-create-leases.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][102] ([Intel XE#2029])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2446])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2446])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1439] / [Intel XE#3141])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2893])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1489]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#3414]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#3414])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#1435])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_universal_plane@universal-plane-pageflip-windowed.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][116] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#756])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1447])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1062])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2905]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2905]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2905]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [PASS][123] -> [FAIL][124] ([Intel XE#2364])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][125] ([Intel XE#2364])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#688]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][129] ([Intel XE#1727])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_exec_compute_mode@many-bindexecqueue.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#288]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#3468]) +6 other tests dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][133] ([Intel XE#1727] / [Intel XE#3468])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][134] ([Intel XE#3467])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3086] / [Intel XE#3343])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][137] ([Intel XE#3467])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][138] -> [FAIL][139] ([Intel XE#3546])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_module_load@many-reload.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3573]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@prime-self-import-coh:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1130]) +28 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_pat@prime-self-import-coh.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][142] -> [INCOMPLETE][143] ([Intel XE#1358] / [Intel XE#569])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][144] -> [ABORT][145] ([Intel XE#1358] / [Intel XE#1607])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@xe_pm@s4-basic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][146] -> [ABORT][147] ([Intel XE#1794])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][148] -> [SKIP][149] ([Intel XE#1130]) +90 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2423]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_getclient.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@core_getclient.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#3086]) -> [PASS][155] +4 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_atomic_interruptible@legacy-cursor.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2136]) -> [PASS][157] +5 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][162] ([Intel XE#2291]) -> [PASS][163] +5 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][164] ([Intel XE#2316]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][166] ([Intel XE#3486]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][168] ([Intel XE#2882]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][170] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][172] ([Intel XE#886]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][175] +4 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2423] / [i915#2575]) -> [PASS][177] +17 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-bmg:          [DMESG-WARN][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_lease@lease-unleased-connector.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_lease@lease-unleased-connector.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][180] ([Intel XE#2571]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2446]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][186] ([Intel XE#899]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][189] +2 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          [DMESG-FAIL][190] ([Intel XE#3468]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][192] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [TIMEOUT][194] ([Intel XE#1473]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1130]) -> [PASS][197] +39 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][198] -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     [INCOMPLETE][200] -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_exec_reset@cm-gt-reset.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][202] ([Intel XE#3371]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#3515]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
    - shard-bmg:          [DMESG-WARN][206] ([Intel XE#3515]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#3468]) -> [PASS][209] +13 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][213] +2 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@d3hot-mmap-vram.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [DMESG-FAIL][214] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@s3-mocs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][216] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][218] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][220] ([Intel XE#958]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1885]) -> [DMESG-WARN][223] ([Intel XE#3468])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][224] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) -> [DMESG-WARN][225] ([Intel XE#324])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#316]) -> [SKIP][227] ([Intel XE#2136] / [Intel XE#2351])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#316]) -> [SKIP][229] ([Intel XE#2136])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][230] ([Intel XE#1231]) -> [DMESG-FAIL][231] ([Intel XE#324])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1124]) -> [SKIP][233] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1124]) -> [SKIP][235] ([Intel XE#2136])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][236] ([Intel XE#324]) -> [FAIL][237] ([Intel XE#1231] / [Intel XE#3052])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][239] ([Intel XE#619])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2136]) -> [SKIP][241] ([Intel XE#1124]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#367]) -> [SKIP][243] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2191]) -> [SKIP][245] ([Intel XE#2423] / [i915#2575])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2423] / [i915#2575]) -> [SKIP][247] ([Intel XE#367])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][249] ([Intel XE#2136] / [Intel XE#2351])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2136]) -> [SKIP][251] ([Intel XE#455] / [Intel XE#787])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2136]) -> [SKIP][253] ([Intel XE#3442])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][255] ([Intel XE#455] / [Intel XE#787])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#2136]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#306]) -> [SKIP][259] ([Intel XE#2423] / [i915#2575])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2423] / [i915#2575]) -> [SKIP][261] ([Intel XE#373]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#373]) -> [SKIP][263] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][264] ([Intel XE#1178]) -> [SKIP][265] ([Intel XE#2423] / [i915#2575])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2423] / [i915#2575]) -> [SKIP][267] ([Intel XE#307])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#307]) -> [SKIP][269] ([Intel XE#2423] / [i915#2575])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][270] ([Intel XE#1178]) -> [SKIP][271] ([Intel XE#2341])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-bmg:          [DMESG-FAIL][272] ([Intel XE#3468]) -> [DMESG-WARN][273] ([Intel XE#3468])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][274] ([Intel XE#3468]) -> [SKIP][275] ([Intel XE#2291])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#455]) -> [SKIP][277] ([Intel XE#2136] / [Intel XE#2351])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#455]) -> [SKIP][279] ([Intel XE#2136]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#701]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][282] ([Intel XE#2882]) -> [SKIP][283] ([Intel XE#2316])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][284] ([Intel XE#301]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][286] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][287] ([Intel XE#1727] / [Intel XE#2049] / [Intel XE#2597] / [Intel XE#3468])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2136]) -> [SKIP][289] ([Intel XE#455])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][290] ([Intel XE#2312]) -> [SKIP][291] ([Intel XE#2311]) +13 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][292] ([Intel XE#2311]) -> [SKIP][293] ([Intel XE#2312]) +18 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#651]) -> [SKIP][295] ([Intel XE#2136] / [Intel XE#2351])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][296] ([Intel XE#2312]) -> [FAIL][297] ([Intel XE#2333]) +7 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][298] ([Intel XE#2333]) -> [SKIP][299] ([Intel XE#2312]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [INCOMPLETE][300] ([Intel XE#1727] / [Intel XE#2050]) -> [SKIP][301] ([Intel XE#2312])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [INCOMPLETE][302] -> [FAIL][303] ([Intel XE#2333])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][304] ([Intel XE#3468]) -> [SKIP][305] ([Intel XE#2312]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#658]) -> [SKIP][307] ([Intel XE#2136] / [Intel XE#2351])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#651]) -> [SKIP][309] ([Intel XE#2136]) +13 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2136]) -> [SKIP][311] ([Intel XE#651]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][313] ([Intel XE#651]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][314] ([Intel XE#2312]) -> [SKIP][315] ([Intel XE#2313]) +12 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#653]) -> [SKIP][317] ([Intel XE#2136] / [Intel XE#2351])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][318] ([Intel XE#2313]) -> [SKIP][319] ([Intel XE#2312]) +20 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][321] ([Intel XE#653])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#653]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#653]) -> [SKIP][325] ([Intel XE#2136]) +17 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][326] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][327] ([Intel XE#3544])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2423] / [i915#2575]) -> [SKIP][329] ([Intel XE#455]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][330] ([Intel XE#3468]) -> [DMESG-FAIL][331] ([Intel XE#3468])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#455]) -> [SKIP][333] ([Intel XE#2423] / [i915#2575])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][335] ([Intel XE#2423] / [i915#2575])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2136]) -> [SKIP][337] ([Intel XE#870])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2938]) -> [SKIP][339] ([Intel XE#2136])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1122]) -> [SKIP][341] ([Intel XE#2136] / [Intel XE#2351])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][342] ([Intel XE#734]) -> [FAIL][343] ([Intel XE#3325])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [ABORT][344] ([Intel XE#3468]) -> [SKIP][345] ([Intel XE#2446])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1489]) -> [SKIP][347] ([Intel XE#2136]) +5 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2136]) -> [SKIP][349] ([Intel XE#1489]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1122]) -> [SKIP][351] ([Intel XE#2136])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][353] ([Intel XE#2850] / [Intel XE#929])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@fbc-pr-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][355] ([Intel XE#2136]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr-basic:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136]) -> [SKIP][357] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@psr-basic.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][359] ([Intel XE#2136] / [Intel XE#2351])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@psr-sprite-plane-move.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#3414]) -> [SKIP][361] ([Intel XE#2423] / [i915#2575])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][362] ([Intel XE#1729]) -> [SKIP][363] ([Intel XE#2426])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][364] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][365] ([Intel XE#3468])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2423] / [i915#2575]) -> [SKIP][367] ([Intel XE#756])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#756]) -> [SKIP][369] ([Intel XE#2423] / [i915#2575])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1123]) -> [SKIP][371] ([Intel XE#1130]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1126]) -> [SKIP][373] ([Intel XE#1130])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#1130]) -> [SKIP][375] ([Intel XE#2905]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2905]) -> [SKIP][377] ([Intel XE#1130]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1130]) -> [SKIP][379] ([Intel XE#288]) +5 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#288]) -> [SKIP][381] ([Intel XE#1130]) +13 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][382] ([Intel XE#3467]) -> [SKIP][383] ([Intel XE#1130])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][384] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][385] ([Intel XE#3467]) +1 other test dmesg-warn
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][386] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][387] ([Intel XE#3343])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1130]) -> [DMESG-WARN][389] ([Intel XE#3343])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][390] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][391] ([Intel XE#3467])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#1130]) -> [SKIP][393] ([Intel XE#3573])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#3573]) -> [SKIP][395] ([Intel XE#1130]) +3 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_oa@polling-small-buf.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#977]) -> [SKIP][397] ([Intel XE#1130])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1130]) -> [SKIP][399] ([Intel XE#2284] / [Intel XE#366])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][401] ([Intel XE#1130]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#944]) -> [SKIP][403] ([Intel XE#1130])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][404] ([Intel XE#2919]) -> [SKIP][405] ([Intel XE#1130])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@basic-wedged.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][406] ([Intel XE#3421]) -> [SKIP][407] ([Intel XE#1130])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -> xe-pw-140666v7

  IGT_8121: 8121
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199
  xe-pw-140666v7: 140666v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html

--===============6697017682135667450==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3lpg: Add Wa_16024792527 (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140666/">https://patchwork.freedesktop.org/series/140666/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_full -&gt; xe-pw-140666v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140666v7_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140666v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140666v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-suspend@b-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140666v7_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_lease@invalid-create-leases.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_exec_compute_mode@many-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_pat@prime-self-import-coh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +90 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_atomic_interruptible@legacy-cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_lease@lease-unleased-connector.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_lease@lease-unleased-connector.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@xe_exec_reset@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-userptr.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_pm@d3hot-mmap-vram.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@s3-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -&gt; xe-pw-140666v7</li>
</ul>
<p>IGT_8121: 8121<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199<br />
  xe-pw-140666v7: 140666v7</p>

</body>
</html>

--===============6697017682135667450==--
