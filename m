Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398D2CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 04:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90610E02D;
	Sat, 27 Sep 2025 04:47:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E8410E008;
 Sat, 27 Sep 2025 04:47:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6625327447984570709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_TileAddrRange_re?=
 =?utf-8?q?gisters_are_deprecated=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 27 Sep 2025 04:47:58 -0000
Message-ID: <175894847805.373025.15747803018919345443@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926211000.318643-1-fei.yang@intel.com>
In-Reply-To: <20250926211000.318643-1-fei.yang@intel.com>
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

--===============6625327447984570709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: TileAddrRange registers are deprecated.
URL   : https://patchwork.freedesktop.org/series/155124/
State : failure

== Summary ==

CI Bug Log - changes from xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412_FULL -> xe-pw-155124v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-155124v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155124v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155124v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][1] ([Intel XE#4543]) -> [TIMEOUT][2] +1 other test timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in xe-pw-155124v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@test-only:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_atomic@test-only.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_atomic@test-only.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#316])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#610])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][8] ([Intel XE#4543]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#2191]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#367]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +41 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#787]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#6014])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#4417] / [Intel XE#455])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#4417]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#306]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#373]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#307])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#309])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#4302])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#4354])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4422])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +8 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4543]) +6 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#651]) +22 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#651]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#653]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#653]) +22 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#656]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#455])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#1503])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#3012])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#356])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2571])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2938])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1129])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2939])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#362])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1500])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#330])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#455] / [Intel XE#5632]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#5890]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1126])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4837]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#4837] / [Intel XE#5565])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4518])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1392] / [Intel XE#5575])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1392])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#288]) +18 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#288] / [Intel XE#5561]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#4915]) +52 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_exec_system_allocator@many-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4915]) +171 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         NOTRUN -> [ABORT][84] ([Intel XE#5530])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#560])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#5100])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#512])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_mmap@small-bar.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#3573]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2838] / [Intel XE#979])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2284] / [Intel XE#366])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#4819]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-436/igt@xe_pmu@gt-frequency.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#4733]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#944]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4130]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4351])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][99] +2 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][100] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][106] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][108] ([Intel XE#2291]) -> [PASS][109] +5 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][110] ([Intel XE#1475]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][112] ([Intel XE#3009]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_dp_aux_dev.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][114] ([Intel XE#2316]) -> [PASS][115] +3 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#4543]) -> [PASS][117] +9 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@dpms-off-confusion-interruptible.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][118] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][120] ([Intel XE#301]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][122] ([Intel XE#4543]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][124] -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][126] ([Intel XE#4596]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][128] ([Intel XE#2883]) -> [PASS][129] +6 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][130] ([Intel XE#2883]) -> [PASS][131] +3 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][132] ([Intel XE#2883]) -> [PASS][133] +2 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][134] ([Intel XE#1435]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][136] ([Intel XE#4227]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-5/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][138] ([Intel XE#1499]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-bmg:          [FAIL][140] -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_system_allocator@fault-benchmark:
    - shard-bmg:          [TIMEOUT][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_exec_system_allocator@fault-benchmark.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-4/igt@xe_exec_system_allocator@fault-benchmark.html

  * {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
    - shard-lnl:          [CRASH][144] ([Intel XE#6192]) -> [PASS][145] +11 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-new-prefetch.html

  * {igt@xe_exec_system_allocator@many-execqueues-new-prefetch}:
    - shard-bmg:          [CRASH][146] ([Intel XE#6192]) -> [PASS][147] +8 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-new-prefetch.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-new-prefetch.html

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - shard-bmg:          [DMESG-FAIL][148] ([Intel XE#3876]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][150] ([Intel XE#2341]) -> [FAIL][151] ([Intel XE#1178])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_content_protection@legacy.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][152] ([Intel XE#1178]) -> [SKIP][153] ([Intel XE#2341])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][155] ([Intel XE#4543]) +1 other test dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][156] ([Intel XE#1874]) -> [DMESG-FAIL][157] ([Intel XE#4543])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#2311]) +12 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][160] ([Intel XE#5390]) -> [SKIP][161] ([Intel XE#2312]) +9 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#5390]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#2312]) +14 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][166] ([Intel XE#2312]) -> [SKIP][167] ([Intel XE#2313]) +13 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#2313]) -> [SKIP][169] ([Intel XE#2312]) +14 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][170] ([Intel XE#5021]) -> [SKIP][171] ([Intel XE#4596])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#362]) -> [FAIL][173] ([Intel XE#1729])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_fault_mode@many-rebind:
    - shard-adlp:         [INCOMPLETE][174] ([Intel XE#2594]) -> [SKIP][175] ([Intel XE#288] / [Intel XE#5561])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-9/igt@xe_exec_fault_mode@many-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_exec_fault_mode@many-rebind.html

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - shard-adlp:         [FAIL][176] -> [DMESG-FAIL][177] ([Intel XE#3876])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-rebind.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][178] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][179] ([Intel XE#5466] / [Intel XE#5530])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [ABORT][180] ([Intel XE#4917] / [Intel XE#5545]) -> [DMESG-FAIL][181] ([Intel XE#5213]) +1 other test dmesg-fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412 -> xe-pw-155124v1

  IGT_8555: 8555
  xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412: 3008c5c8e2fade05918e6d8c456572c91f30d412
  xe-pw-155124v1: 155124v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/index.html

--===============6625327447984570709==
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
<tr><td><b>Series:</b></td><td>drm/xe: TileAddrRange registers are deprecated.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155124/">https://patchwork.freedesktop.org/series/155124/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412_FULL -&gt; xe-pw-155124v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-155124v1_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155124v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155124v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155124v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_atomic@test-only.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014">Intel XE#6014</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632">Intel XE#5632</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_evict@evict-beng-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_exec_system_allocator@many-new-bo-map.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +171 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-436/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-9/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@dpms-off-confusion-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-5/igt@kms_setmode@basic@pipe-a-dp-2.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-5/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_exec_system_allocator@fault-benchmark.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-4/igt@xe_exec_system_allocator@fault-benchmark.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-new-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-new-prefetch.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-new-prefetch.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-execqueues-new-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-new-prefetch.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-new-prefetch.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-9/igt@xe_exec_fault_mode@many-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-8/igt@xe_exec_fault_mode@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155124v1/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412 -&gt; xe-pw-155124v1</li>
</ul>
<p>IGT_8555: 8555<br />
  xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412: 3008c5c8e2fade05918e6d8c456572c91f30d412<br />
  xe-pw-155124v1: 155124v1</p>

</body>
</html>

--===============6625327447984570709==--
