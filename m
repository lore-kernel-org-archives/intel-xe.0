Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDF7D5E386
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 23:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383CA10E0FD;
	Sat,  9 Nov 2024 23:58:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6A10E0CD;
 Sat,  9 Nov 2024 23:58:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1555116731750911637=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?platform/x86/intel/pmt=3A_allow_user_offset_for_PMT_callbacks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 23:58:52 -0000
Message-ID: <173119673245.1946529.7287445986782407010@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
In-Reply-To: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
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

--===============1555116731750911637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] platform/x86/intel/pmt: allow user offset for PMT callbacks
URL   : https://patchwork.freedesktop.org/series/141118/
State : failure

== Summary ==

CI Bug Log - changes from xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e_full -> xe-pw-141118v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141118v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141118v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141118v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  
#### Warnings ####

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#2423] / [i915#2575]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][9] ([Intel XE#1630]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-141118v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#1885])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@core_hotunplug@hotrebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2134]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@fbdev@eof.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@fbdev@eof.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#3194]) +3 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2423] / [i915#2575]) +38 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3086])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1701]) +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +149 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2907]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +14 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#307])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#3407])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#323])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#309]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#1475])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#3009])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_draw_crc@fill-fb.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_draw_crc@fill-fb.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2890]) +28 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1137])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#301]) +2 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#301]) +4 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#310]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#2423] / [i915#2575]) +79 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#2049])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#656]) +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2351] / [Intel XE#2890]) +14 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#2333])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][71] ([Intel XE#1861])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#2890]) +16 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1151])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2311]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#653]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2925])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][80] ([Intel XE#2566])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#1471]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-5/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2763]) +11 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2763]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#870])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1129]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#3129])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-lnl:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#3184])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2042])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-7/igt@kms_pm_rpm@drm-resources-equal.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2446])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#2446]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1489]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1122]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][103] ([Intel XE#1874]) +4 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#455]) +8 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#756])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1091] / [Intel XE#2849])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1126])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2905]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2905]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - shard-adlp:         [PASS][112] -> [TIMEOUT][113] ([Intel XE#1033] / [Intel XE#1727])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1392]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#288]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#1630]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#3320])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][120] -> [FAIL][121] ([Intel XE#1630]) +2 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#288]) +9 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1130]) +59 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][124] ([Intel XE#358])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [PASS][125] -> [DMESG-WARN][126] ([Intel XE#3389])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][127] -> [DMESG-FAIL][128] ([Intel XE#3371])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][129] ([Intel XE#3343]) +6 other tests dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][130] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][131] -> [FAIL][132] ([Intel XE#2136])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_module_load@many-reload.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#379])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2541]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#2541]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1607])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@xe_pm@s4-basic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][138] -> [ABORT][139] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][140] -> [ABORT][141] ([Intel XE#1794])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         NOTRUN -> [FAIL][142] ([Intel XE#958])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-topology:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#944])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#944]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_vm@large-userptr-misaligned-binds-268435456:
    - shard-adlp:         [PASS][145] -> [DMESG-WARN][146] ([Intel XE#1033] / [Intel XE#1727])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@xe_vm@large-userptr-misaligned-binds-268435456.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_vm@large-userptr-misaligned-binds-268435456.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#1130]) +138 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1885]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2134]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@fbdev@read.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@fbdev@read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][153] ([Intel XE#1426]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][155] ([Intel XE#2613]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_color@ctm-0-50@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][157] ([Intel XE#2929]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_color@ctm-0-50@pipe-c-edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_color@ctm-0-50@pipe-c-edp-1.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-adlp:         [DMESG-WARN][159] ([Intel XE#3086]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-2/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-4/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][161] ([Intel XE#877]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [INCOMPLETE][163] ([Intel XE#3226]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [FAIL][165] ([Intel XE#1475]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][167] ([Intel XE#1541]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2423] / [i915#2575]) -> [PASS][172] +85 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip@busy-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][173] ([Intel XE#301]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][175] ([Intel XE#886]) -> [PASS][176] +7 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][177] ([Intel XE#3403] / [Intel XE#886]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][180] +9 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          [FAIL][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2890]) -> [PASS][184] +30 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][185] ([Intel XE#1430]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@legacy-planes@plane-68:
    - shard-lnl:          [DMESG-WARN][187] ([Intel XE#3184]) -> [PASS][188] +4 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes@plane-68.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2446]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][191] ([Intel XE#2042]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][193] ([Intel XE#771] / [Intel XE#899]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          [FAIL][195] ([Intel XE#899]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][197] ([Intel XE#899]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][199] ([Intel XE#1630]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][201] ([Intel XE#3320]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [ABORT][203] ([Intel XE#1694]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][205] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][207] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][209] ([Intel XE#1358]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][211] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_vm@large-binds-2147483648:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1130]) -> [PASS][214] +161 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_vm@large-binds-2147483648.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_vm@large-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2423] / [i915#2575]) -> [SKIP][216] ([Intel XE#623])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#873]) -> [SKIP][218] ([Intel XE#2423] / [i915#2575])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#316]) -> [SKIP][220] ([Intel XE#2890]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2890]) -> [SKIP][222] ([Intel XE#316]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][224] ([Intel XE#316]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#316]) -> [SKIP][226] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][228] ([Intel XE#1124]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2890]) -> [SKIP][230] ([Intel XE#1124]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#607]) -> [SKIP][232] ([Intel XE#2890])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1124]) -> [SKIP][234] ([Intel XE#2351] / [Intel XE#2890]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1124]) -> [SKIP][236] ([Intel XE#2890]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2423] / [i915#2575]) -> [SKIP][238] ([Intel XE#367]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#367]) -> [SKIP][240] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423] / [i915#2575]) -> [SKIP][242] ([Intel XE#2191]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2907]) -> [SKIP][244] ([Intel XE#2890]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2890]) -> [SKIP][246] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][248] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][249] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][250] ([Intel XE#2351] / [Intel XE#2890])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2890]) -> [SKIP][252] ([Intel XE#2907]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][254] ([Intel XE#2890]) +10 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [SKIP][256] ([Intel XE#306])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#306]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#373]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#373]) +8 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [FAIL][264] ([Intel XE#1178]) +1 other test fail
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#307])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][267] ([Intel XE#1178]) -> [SKIP][268] ([Intel XE#2423] / [i915#2575])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_content_protection@legacy.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#308]) -> [SKIP][270] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2423] / [i915#2575]) -> [SKIP][272] ([Intel XE#455]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [SKIP][274] ([Intel XE#308]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#455]) -> [SKIP][276] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#323]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][282] ([Intel XE#455])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#776]) -> [SKIP][284] ([Intel XE#2890])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2423] / [i915#2575]) -> [SKIP][286] ([Intel XE#703])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1135]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][290] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455]) -> [SKIP][292] ([Intel XE#2890]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2890]) -> [SKIP][294] ([Intel XE#455]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2890]) -> [SKIP][296] ([Intel XE#651]) +21 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][297] ([Intel XE#656]) -> [TIMEOUT][298] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#651]) -> [SKIP][300] ([Intel XE#2890]) +14 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][302] ([Intel XE#651]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [FAIL][303] ([Intel XE#1861]) -> [TIMEOUT][304] ([Intel XE#1033] / [Intel XE#1727])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#651]) -> [SKIP][306] ([Intel XE#2351] / [Intel XE#2890]) +12 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][308] ([Intel XE#653]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#653]) -> [SKIP][310] ([Intel XE#2890]) +24 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][312] ([Intel XE#658])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2890]) -> [SKIP][314] ([Intel XE#653]) +26 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#653]) -> [SKIP][316] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2890]) -> [SKIP][318] ([Intel XE#2925])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][319] ([Intel XE#1035]) -> [INCOMPLETE][320] ([Intel XE#1035] / [Intel XE#1195])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-3/igt@kms_plane@pixel-format.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#870]) -> [SKIP][324] ([Intel XE#2890])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1122]) -> [SKIP][326] ([Intel XE#2351] / [Intel XE#2890])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][327] -> [SKIP][328] ([Intel XE#3309])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#908]) -> [SKIP][330] ([Intel XE#2890])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1489]) -> [SKIP][332] ([Intel XE#2890]) +8 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2890]) -> [SKIP][334] ([Intel XE#1489]) +8 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1122]) -> [SKIP][336] ([Intel XE#2890])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][338] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][340] ([Intel XE#2890]) +9 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2890]) -> [SKIP][342] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][344] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2939]) -> [SKIP][346] ([Intel XE#2890])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][347] -> [SKIP][348] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2423] / [i915#2575]) -> [SKIP][350] ([Intel XE#1127])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#362]) -> [FAIL][352] ([Intel XE#1729])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2423] / [i915#2575]) -> [SKIP][354] ([Intel XE#330])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#2168])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_vrr@lobf.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_vrr@lobf.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1130]) -> [SKIP][358] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1123]) -> [SKIP][360] ([Intel XE#1130]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1130]) -> [SKIP][362] ([Intel XE#1126])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-dg2-set2:     [FAIL][363] ([Intel XE#2667]) -> [SKIP][364] ([Intel XE#1130])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2905]) -> [SKIP][366] ([Intel XE#1130]) +9 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1130]) -> [FAIL][368] ([Intel XE#1600])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][369] ([Intel XE#1000]) -> [TIMEOUT][370] ([Intel XE#1473])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#288]) -> [SKIP][372] ([Intel XE#1130]) +20 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1130]) -> [SKIP][374] ([Intel XE#288]) +27 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2360]) -> [SKIP][376] ([Intel XE#1130]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1130]) -> [SKIP][378] ([Intel XE#2905]) +10 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#512]) -> [SKIP][380] ([Intel XE#1130])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_mmap@small-bar.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1130]) -> [SKIP][382] ([Intel XE#2541]) +7 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2541]) -> [SKIP][384] ([Intel XE#1130]) +6 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1130]) -> [SKIP][386] ([Intel XE#2839] / [Intel XE#977])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][388] ([Intel XE#1130])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][390] ([Intel XE#1130]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1130]) -> [SKIP][392] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1130]) -> [SKIP][394] ([Intel XE#944]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#944]) -> [SKIP][396] ([Intel XE#1130])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#3342]) -> [SKIP][398] ([Intel XE#1130])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][399] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][400] ([Intel XE#1130])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3389
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e -> xe-pw-141118v1

  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e: 3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e
  xe-pw-141118v1: 141118v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/index.html

--===============1555116731750911637==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] platform/x86/intel/pmt: allow user offset for PMT callbacks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141118/">https://patchwork.freedesktop.org/series/141118/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e_full -&gt; xe-pw-141118v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141118v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141118v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141118v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141118v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_draw_crc@fill-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-5/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129">Intel XE#3129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3389">Intel XE#3389</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-268435456:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@xe_vm@large-userptr-misaligned-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_vm@large-userptr-misaligned-binds-268435456.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +138 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@fbdev@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_color@ctm-0-50@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_color@ctm-0-50@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-2/igt@kms_cursor_edge_walk@64x64-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-4/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_flip@busy-flip.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403">Intel XE#3403</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes@plane-68.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_vm@large-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_vm@large-binds-2147483648.html">PASS</a> +161 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-adlp-8/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141118v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e -&gt; xe-pw-141118v1</li>
</ul>
<p>IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2192-3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e: 3bd35b8c2fe7a3a8a31d5d619ff190e06b66af0e<br />
  xe-pw-141118v1: 141118v1</p>

</body>
</html>

--===============1555116731750911637==--
