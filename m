Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A732CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1095510E4F8;
	Mon, 13 Oct 2025 22:03:03 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C906710E05A;
 Mon, 13 Oct 2025 22:03:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2516395991072885659=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Avoid_crash_during_dump_wh?=
 =?utf-8?q?en_finding_an_evicted_BO_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: simon.richter@hogyros.de
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 22:03:01 -0000
Message-ID: <176039298180.7102.15457557879763806444@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
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

--===============2516395991072885659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Avoid crash during dump when finding an evicted BO (rev3)
URL   : https://patchwork.freedesktop.org/series/155787/
State : failure

== Summary ==

CI Bug Log - changes from xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626_FULL -> xe-pw-155787v3_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-155787v3_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155787v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155787v3_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][1] ([Intel XE#2313]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  
New tests
---------

  New tests have been introduced between xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626_FULL and xe-pw-155787v3_FULL:

### New IGT tests (1) ###

  * igt@kms_atomic@atomic-plane-damage@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  

Known issues
------------

  Here are the changes found in xe-pw-155787v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +4 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#619])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][10] ([Intel XE#4543]) +6 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#619])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#2191]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +20 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2907])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#3442])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +47 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#4417] / [Intel XE#455])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#4417]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#306]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#373]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455]) +16 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#308]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#323])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1340])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4494] / [i915#3804])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#4354])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#4354])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2244]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#5425])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2373])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1138])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#310]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][65] ([Intel XE#4543]) +20 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2293] / [Intel XE#2380])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +16 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#5390]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#656]) +35 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2352])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#651]) +11 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1158])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +11 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2313]) +18 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#653]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2925]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2934])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2486])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][81] ([Intel XE#5195]) +4 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#4596])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#5021])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#870]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_pm_backlight@fade.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#870])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#3309])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][87] ([Intel XE#718])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1129])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1129])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2007])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#836])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_psr@psr-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1127])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#3414]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3414] / [Intel XE#3904])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#1435])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#1499])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1123])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#5626]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4837]) +8 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4837]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#4837] / [Intel XE#5565]) +12 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#5793])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#261] / [Intel XE#5564]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#261]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#688]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1392] / [Intel XE#5575]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2322]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#288] / [Intel XE#5561]) +23 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#288]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][121] ([Intel XE#3868])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#4915]) +249 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4915]) +70 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap:
    - shard-bmg:          [PASS][124] -> [DMESG-WARN][125] ([Intel XE#3428])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4943]) +12 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][127] -> [DMESG-WARN][128] ([Intel XE#5893])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2833])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#455] / [Intel XE#5712])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#512])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#586])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3573])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#3573]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2838] / [Intel XE#979])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#979])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#5742])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#5742])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4650])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4733]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#4733] / [Intel XE#5594])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#4733])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#944])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#944]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#4821])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][147] ([Intel XE#3908]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [SKIP][149] ([Intel XE#4879]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_color@deep-color.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][151] ([Intel XE#2291]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][153] ([Intel XE#4633]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][155] -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][157] ([Intel XE#2373]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][159] ([Intel XE#2316]) -> [PASS][160] +5 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#4543]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * {igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc}:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-bmg:          [DMESG-WARN][167] ([Intel XE#3428]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_invalid_mode@clock-too-high.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_invalid_mode@clock-too-high.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][169] ([Intel XE#6321]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@twice-null-rebind:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#3876]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_basic@twice-null-rebind.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_basic@twice-null-rebind.html

  * igt@xe_exec_compute_mode@many-userptr-rebind:
    - shard-bmg:          [FAIL][173] ([Intel XE#5625]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_compute_mode@many-userptr-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_compute_mode@many-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
    - shard-bmg:          [FAIL][175] ([Intel XE#6050]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [FAIL][177] ([Intel XE#6325]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - shard-bmg:          [FAIL][179] ([Intel XE#4937] / [Intel XE#5625]) -> [PASS][180] +27 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - shard-bmg:          [DMESG-FAIL][181] ([Intel XE#3876]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-basic.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-bmg:          [TIMEOUT][183] ([Intel XE#3876]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_gt_freq@freq_range_exec.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_gt_freq@freq_range_exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#4543]) -> [DMESG-FAIL][186] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][188] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][189] ([Intel XE#2341]) -> [FAIL][190] ([Intel XE#1178])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][191] ([Intel XE#5299]) -> [FAIL][192] ([Intel XE#4633])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#5208]) -> [DMESG-WARN][194] ([Intel XE#4543] / [Intel XE#5208])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#2311]) +7 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][197] ([Intel XE#2311]) -> [SKIP][198] ([Intel XE#2312]) +17 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#5390]) -> [SKIP][200] ([Intel XE#2312]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#2312]) -> [SKIP][202] ([Intel XE#5390]) +7 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#2313]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][205] ([Intel XE#2313]) -> [SKIP][206] ([Intel XE#2312]) +18 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][207] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][208] ([Intel XE#3544])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][209] ([Intel XE#4596]) -> [SKIP][210] ([Intel XE#5021])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][211] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][212] ([Intel XE#5466] / [Intel XE#5530])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [SKIP][226], [PASS][227], [PASS][228], [PASS][229], [DMESG-WARN][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][239], [PASS][240], [PASS][241], [SKIP][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264]) ([Intel XE#2457])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-8/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6320
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
  [Intel XE#6326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6326
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626 -> xe-pw-155787v3

  IGT_8582: 8582
  xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626: 61b16793c3bbb8e740cf9afb36258dee61346626
  xe-pw-155787v3: 155787v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/index.html

--===============2516395991072885659==
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
<tr><td><b>Series:</b></td><td>Avoid crash during dump when finding an evic=
ted BO (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155787/">https://patchwork.freedesktop.org/series/155787/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155787v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155787v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3908-61b16793c3bbb8e740cf9afb36258dee6=
1346626_FULL -&gt; xe-pw-155787v3_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-155787v3_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155787v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1557=
87v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
87v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-=
blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3908-61b16793c3bbb8e740cf9afb3=
6258dee61346626_FULL and xe-pw-155787v3_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic@atomic-plane-damage@pipe-b-hdmi-a-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155787v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp=
-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_ato=
mic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/=
igt@kms_atomic_transition@plane-all-transition-nonblocking.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">=
Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard=
-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-w=
ithout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_cursor_crc@cursor-offscr=
een-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_dsc@dsc-with-formats.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">I=
ntel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-h=
dmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>) +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +35 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests =
skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007=
">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">I=
ntel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@kms_psr@psr2-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_copy_basic@mem-copy-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_eu_stall@non-blocking-re-=
enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5564">Intel XE#5564</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_evict@evict-large-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a=
>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +23 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_exec_system_allocator@pro=
cesses-evict-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +249 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-many-stride-malloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +70 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-dontunmap=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-many-stride-mmap-remap-ro-dontunmap.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/=
shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro-=
dontunmap.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +12 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-4=
33/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5712">Intel XE#5712</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pm@d3hot-i2c.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">I=
ntel XE#5742</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_pxp@pxp-termination-key-=
update-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_query@multigpu-query-gt-=
list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-adlp-6/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155787v3/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
87v3/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4879">Intel XE#4879</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_color@deep-col=
or.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-b=
mg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-432/igt@kms_cu=
rsor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-dg2-434/igt@kms_c=
ursor_legacy@torture-move@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg=
-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
787v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc}:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">I=
ntel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155787v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fb=
c-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_inva=
lid_mode@clock-too-high.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@k=
ms_invalid_mode@clock-too-high.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg=
-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
basic@twice-null-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@x=
e_exec_basic@twice-null-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
compute_mode@many-userptr-rebind.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/ig=
t@xe_exec_compute_mode@many-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-imm.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6050">Intel XE#6050</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
reset@cm-gt-reset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6325">Intel XE#6325</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_exec_reset=
@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-malloc-bo-unmap.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel=
 XE#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-b=
o-unmap.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_exec_=
threads@threads-bal-shared-vm-basic.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard=
-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_gt_fr=
eq@freq_range_exec.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_gt_fre=
q@freq_range_exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-9/igt@kms_big=
_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-8/=
igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155787v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-adlp-9=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Inte=
l XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155787v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v=
3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
87v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
87v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55787v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v=
3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee6134=
6626/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee=
61346626/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb3625=
8dee61346626/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb=
36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf=
9afb36258dee61346626/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e7=
40cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bb=
b8e740cf9afb36258dee61346626/shard-bmg-1/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793=
c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b1=
6793c3bbb8e740cf9afb36258dee61346626/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3908-=
61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bmg-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626/=
shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee61346=
626/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3908-61b16793c3bbb8e740cf9afb36258dee6=
1346626/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155787v3/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155787v3/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155787v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626 -&gt; xe-pw-155=
787v3</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626: 61b16793c3bbb8e740cf9af=
b36258dee61346626<br />
  xe-pw-155787v3: 155787v3</p>

</body>
</html>

--===============2516395991072885659==--
