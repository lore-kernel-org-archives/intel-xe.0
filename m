Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E86C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8A310E3C7;
	Fri, 11 Jul 2025 19:53:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E48F10E3C7;
 Fri, 11 Jul 2025 19:53:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0451232970166628088=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Improve_VF_provi?=
 =?utf-8?q?sion_stability_with_fault_injection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Jul 2025 19:53:44 -0000
Message-ID: <175226362450.155881.7246747197549969280@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711115135.1113303-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250711115135.1113303-1-satyanarayana.k.v.p@intel.com>
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

--===============0451232970166628088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve VF provision stability with fault injection
URL   : https://patchwork.freedesktop.org/series/151499/
State : failure

== Summary ==

CI Bug Log - changes from xe-3398-10c689346e839238d8496205eee64562ce8e992c_FULL -> xe-pw-151499v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151499v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151499v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151499v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-3/igt@xe_pat@pat-index-xe2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@xe_pat@pat-index-xe2.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_copy_basic@mem-set-linear-0x8fffe}:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x8fffe.html

  
Known issues
------------

  Here are the changes found in xe-pw-151499v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3157])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#873])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#873])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#873])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#3908]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#4543]) +6 other tests dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#619])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#610])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#610])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1428])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#367]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#367]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1512])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +160 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#3442])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#3442])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2907])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#787]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#1727] / [Intel XE#3113])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4417]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2325])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#306])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#373]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2252]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#373]) +13 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#1178]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#307])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#1188])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#308])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1424])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2291])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#5354])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#323])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1508])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#4302])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_display_modes@extended-mode-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4302])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4302])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#3009])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_dp_aux_dev.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#4294])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#5425])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1135])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2316]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][83] -> [DMESG-WARN][84] ([Intel XE#4543]) +23 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#455]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401] / [Intel XE#1745])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1397] / [Intel XE#1745])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1397])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#455]) +21 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#656]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2312]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#651]) +29 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2311]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#5390]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#651])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#651])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#653])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2313]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#653]) +33 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2934])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2925])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#4596])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#5021])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2938])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2938])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#870])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#870])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#718])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1489]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1489]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4608])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_psr@pr-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2939])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2330])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1127])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#1435])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#330])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2168])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_vrr@cmrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1091] / [Intel XE#2849])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1091] / [Intel XE#2849])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1447])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#5419]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4837]) +11 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4837]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#688])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2322]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1392]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#288]) +22 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2360]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2360])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#4915]) +28 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-new-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4943]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#4943]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#5018])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4915]) +266 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2229])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#560])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1416])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-8/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1008])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@xe_mmap@vram.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#4501])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2541] / [Intel XE#3573])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2284]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#2284] / [Intel XE#366])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4733]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#944]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4814])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4821])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#4130])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#4130]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#4130])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4351])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4351])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][176] ([Intel XE#4208]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@core_getversion@all-cards.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#4208] / [i915#2575]) -> [PASS][179] +2 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-32.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][180] ([Intel XE#911]) -> [PASS][181] +7 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][184] ([Intel XE#4543]) -> [PASS][185] +7 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][186] ([Intel XE#3862]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][188] ([Intel XE#5354]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][190] ([Intel XE#2291]) -> [PASS][191] +4 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][192] ([Intel XE#1340]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][194] ([Intel XE#4354]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][196] ([Intel XE#2316]) -> [PASS][197] +9 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][198] ([Intel XE#5338]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][200] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][202] ([Intel XE#301]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][206] ([Intel XE#4543]) -> [PASS][207] +5 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][208] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][209] +3 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][210] ([Intel XE#4596]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][212] ([Intel XE#718]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][214] ([Intel XE#4692]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1392]) -> [PASS][217] +7 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208]) -> [PASS][219] +4 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#3876]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html

  
#### Warnings ####

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208] / [i915#2575]) -> [SKIP][223] ([Intel XE#367])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][225] ([Intel XE#455] / [Intel XE#787])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][226] ([Intel XE#2341]) -> [FAIL][227] ([Intel XE#1178])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][228] ([Intel XE#2341]) -> [FAIL][229] ([Intel XE#1188])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_content_protection@uevent.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][230] ([Intel XE#2311]) -> [SKIP][231] ([Intel XE#2312]) +17 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][232] ([Intel XE#5390]) -> [SKIP][233] ([Intel XE#2312]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][234] ([Intel XE#2312]) -> [SKIP][235] ([Intel XE#5390]) +11 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][236] ([Intel XE#2312]) -> [SKIP][237] ([Intel XE#2311]) +19 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][238] ([Intel XE#2313]) -> [SKIP][239] ([Intel XE#2312]) +12 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#4208]) -> [SKIP][241] ([Intel XE#653])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [SKIP][243] ([Intel XE#2313]) +18 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][244] ([Intel XE#5021]) -> [SKIP][245] ([Intel XE#4596]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][246] ([Intel XE#1909]) -> [SKIP][247] ([Intel XE#736])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][249] ([Intel XE#2850] / [Intel XE#929])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_psr@pr-sprite-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr@pr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][250] ([Intel XE#2426]) -> [SKIP][251] ([Intel XE#2509])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#4208]) -> [SKIP][253] ([Intel XE#288]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#4208]) -> [SKIP][255] ([Intel XE#4915]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#4208]) -> [SKIP][257] ([Intel XE#2284] / [Intel XE#366])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8451 -> IGT_8452
  * Linux: xe-3398-10c689346e839238d8496205eee64562ce8e992c -> xe-pw-151499v1

  IGT_8451: 8451
  IGT_8452: 8452
  xe-3398-10c689346e839238d8496205eee64562ce8e992c: 10c689346e839238d8496205eee64562ce8e992c
  xe-pw-151499v1: 151499v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/index.html

--===============0451232970166628088==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve VF provision stability with fault injection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151499/">https://patchwork.freedesktop.org/series/151499/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3398-10c689346e839238d8496205eee64562ce8e992c_FULL -&gt; xe-pw-151499v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151499v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151499v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151499v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-3/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@xe_pat@pat-index-xe2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_copy_basic@mem-set-linear-0x8fffe}:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x8fffe.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151499v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-3/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +266 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-4/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-432/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-436/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3398-10c689346e839238d8496205eee64562ce8e992c/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v1/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8451 -&gt; IGT_8452</li>
<li>Linux: xe-3398-10c689346e839238d8496205eee64562ce8e992c -&gt; xe-pw-151499v1</li>
</ul>
<p>IGT_8451: 8451<br />
  IGT_8452: 8452<br />
  xe-3398-10c689346e839238d8496205eee64562ce8e992c: 10c689346e839238d8496205eee64562ce8e992c<br />
  xe-pw-151499v1: 151499v1</p>

</body>
</html>

--===============0451232970166628088==--
