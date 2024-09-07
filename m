Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150AAE6FE51
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 08:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B394510E202;
	Sat,  7 Sep 2024 08:26:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7040410E202;
 Sat,  7 Sep 2024 08:26:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2808393862346376338=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_use_IS=5FENABLED=28?=
 =?utf-8?q?=29_instead_of_defined=28=29_on_config_options_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 08:26:36 -0000
Message-ID: <172569759644.955479.12384718016846579995@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904145231.3902289-1-jani.nikula@intel.com>
In-Reply-To: <20240904145231.3902289-1-jani.nikula@intel.com>
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

--===============2808393862346376338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: use IS_ENABLED() instead of defined() on config options (rev2)
URL   : https://patchwork.freedesktop.org/series/138216/
State : failure

== Summary ==

CI Bug Log - changes from xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2_full -> xe-pw-138216v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138216v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138216v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138216v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_pm_rpm@universal-planes@plane-32.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html

  
Known issues
------------

  Here are the changes found in xe-pw-138216v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#324]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#873])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#1426]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1659])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][11] ([Intel XE#1231])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1399])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#314] / [Intel XE#599])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#314]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1424])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#310])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1874]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#651]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#656]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#324])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#324])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#361]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#870])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2042])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#929])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1437]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#899]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#1447])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1447])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#1000])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_evict@evict-small-external.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#688])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1392]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#379])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_noexec_ping_pong.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#379])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_noexec_ping_pong.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - {shard-bmg}:        [DMESG-FAIL][59] ([Intel XE#1033] / [Intel XE#877]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - {shard-bmg}:        [DMESG-FAIL][61] ([Intel XE#1033]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][63] ([Intel XE#324]) -> [PASS][64] +2 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][65] ([Intel XE#1701]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - {shard-bmg}:        [FAIL][67] ([Intel XE#1426]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][69] ([Intel XE#1426]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][71] ([Intel XE#2436]) -> [PASS][72] +2 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#877]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_legacy@single-bo.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#877]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-9/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][77] ([Intel XE#877]) -> [PASS][78] +4 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][79] ([Intel XE#886]) -> [PASS][80] +3 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][81] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][83] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][85] ([Intel XE#324]) -> [PASS][86] +4 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_plane@plane-position-covered.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - {shard-bmg}:        [DMESG-WARN][87] -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][89] ([Intel XE#899]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#771] / [Intel XE#899]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#899]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [FAIL][95] ([Intel XE#1069]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][97] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [ABORT][99] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#623]) -> [SKIP][102] ([Intel XE#1201] / [Intel XE#623])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][104] ([Intel XE#316]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#316]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1231]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][110] ([Intel XE#607])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#610]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#610])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][114] ([Intel XE#1124]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][116] ([Intel XE#619])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1124]) -> [SKIP][118] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#346]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#346])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_joiner@basic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][122] ([Intel XE#346])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][124] ([Intel XE#367]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#2191]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#367]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#367])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#787]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#787]) +97 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][134] ([Intel XE#787]) +62 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][136] ([Intel XE#1252])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][138] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#314]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#314])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#306]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][144] ([Intel XE#373]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#373]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#307]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][150] ([Intel XE#307])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][152] ([Intel XE#455]) +8 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][154] ([Intel XE#308])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#308]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#308])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#323]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#323])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][160] ([Intel XE#323])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][162] ([Intel XE#703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#455]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#455]) +19 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#651]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][168] ([Intel XE#651]) +23 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][170] ([Intel XE#653]) +21 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#653]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#653]) +28 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#498]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][180] ([Intel XE#2318]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2318]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][186] ([Intel XE#870])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#870]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#870])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][190] ([Intel XE#1489]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1489]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1122]) -> [SKIP][194] ([Intel XE#1122] / [Intel XE#1201])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1122])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#929]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][200] ([Intel XE#929]) +9 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][202] ([Intel XE#1149])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][204] ([Intel XE#1127])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#327]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#327])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1500]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#1500])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#756]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#756])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][212] ([Intel XE#756])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1123])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][218] ([Intel XE#288]) +17 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#288]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#288]) +23 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][222] ([Intel XE#2360]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][224] ([Intel XE#512])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_mmap@small-bar.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#378]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#378])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_module_load@force-load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][228] ([Intel XE#2541]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2541]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#2541]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][232] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][234] ([Intel XE#579])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][236] ([Intel XE#944]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#944]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2 -> xe-pw-138216v2

  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2: 2506b22405f9ae0b1f51b0f7d61e900560c9dfe2
  xe-pw-138216v2: 138216v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/index.html

--===============2808393862346376338==
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
<tr><td><b>Series:</b></td><td>drm/xe: use IS_ENABLED() instead of defined() on config options (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138216/">https://patchwork.freedesktop.org/series/138216/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2_full -&gt; xe-pw-138216v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138216v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138216v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138216v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes@plane-32:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_pm_rpm@universal-planes@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138216v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_cursor_legacy@single-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-9/igt@kms_cursor_legacy@torture-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@ac-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-4/igt@kms_plane@plane-position-covered.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +2 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138216v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2 -&gt; xe-pw-138216v2</li>
</ul>
<p>IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1892-2506b22405f9ae0b1f51b0f7d61e900560c9dfe2: 2506b22405f9ae0b1f51b0f7d61e900560c9dfe2<br />
  xe-pw-138216v2: 138216v2</p>

</body>
</html>

--===============2808393862346376338==--
