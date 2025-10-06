Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E6CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FF710E45F;
	Mon,  6 Oct 2025 20:13:03 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3910E45F;
 Mon,  6 Oct 2025 20:13:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8802723484562204646=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Fix_typos_and_im?=
 =?utf-8?q?prove_kernel-doc_comments_in_xe=5Fgt_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 20:13:02 -0000
Message-ID: <175978158295.8781.8336982825212012376@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003234850.2481736-2-shuicheng.lin@intel.com>
In-Reply-To: <20251003234850.2481736-2-shuicheng.lin@intel.com>
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

--===============8802723484562204646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix typos and improve kernel-doc comments in xe_gt (rev2)
URL   : https://patchwork.freedesktop.org/series/155409/
State : success

== Summary ==

CI Bug Log - changes from xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf_FULL -> xe-pw-155409v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155409v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#316])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#316]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2314] / [Intel XE#2894])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#787]) +14 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3442])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +132 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#306]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#373]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#373]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#1178]) +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1188])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#308])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#309]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][25] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#4354])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#310]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][30] -> [DMESG-WARN][31] ([Intel XE#4543] / [Intel XE#5208])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#4543]) +10 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2293] / [Intel XE#2380])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         NOTRUN -> [FAIL][44] ([Intel XE#1874])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][45] ([Intel XE#4543]) +2 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#651])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#656]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#651]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2313])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#653]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#653]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#1503])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4298])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#3012])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2927])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#616]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#870])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#836])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#3414]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1729])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#5890]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#5626])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4837]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4518])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#1392]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#288] / [Intel XE#5561]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#288]) +11 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4915]) +108 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4943])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@xe_exec_system_allocator@many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#4915]) +38 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106]) -> ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [SKIP][132]) ([Intel XE#378])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-435/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-435/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-433/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-433/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-433/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-435/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-464/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-464/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-464/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][133] -> [DMESG-WARN][134] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5244])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-3/igt@xe_module_load@many-reload.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-3/igt@xe_module_load@many-reload.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#3573]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#3573])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#977])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][138] ([Intel XE#1173])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2284] / [Intel XE#366])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#579])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#4733])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4733])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#4733] / [Intel XE#5594])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4814])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_render_copy@render-stress-4-copies.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][145] ([Intel XE#6078]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][147] ([Intel XE#2291]) -> [PASS][148] +4 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][149] ([Intel XE#1475]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][151] ([Intel XE#4633]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][153] ([Intel XE#4354]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][155] ([Intel XE#4294]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][157] ([Intel XE#3321]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][159] ([Intel XE#2316]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#4543]) -> [PASS][162] +7 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][163] ([Intel XE#301]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][165] ([Intel XE#1503]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][167] ([Intel XE#3012]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][169] ([Intel XE#2571]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][171] ([Intel XE#2142]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1392]) -> [PASS][174] +4 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race:
    - shard-bmg:          [INCOMPLETE][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#5893]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][183] ([Intel XE#2341]) -> [FAIL][184] ([Intel XE#1178])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_content_protection@srm.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#4543] / [Intel XE#4921]) -> [DMESG-FAIL][186] ([Intel XE#4921]) +1 other test dmesg-fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2311]) -> [SKIP][188] ([Intel XE#2312]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][189] ([Intel XE#5390]) -> [SKIP][190] ([Intel XE#2312]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#5390]) +10 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2311]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][195] ([Intel XE#2313]) -> [SKIP][196] ([Intel XE#2312]) +6 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][197] ([Intel XE#2312]) -> [SKIP][198] ([Intel XE#2313]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#362]) -> [SKIP][200] ([Intel XE#1500])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][201] ([Intel XE#5530]) -> [ABORT][202] ([Intel XE#4917] / [Intel XE#5530])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][203] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][204] ([Intel XE#5466] / [Intel XE#5530])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1061]) -> [FAIL][206] ([Intel XE#1173])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_peer2peer@read.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#5213]) -> [ABORT][208] ([Intel XE#4917]) +1 other test abort
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-9/igt@xe_sriov_scheduling@equal-throughput.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-9/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -> xe-pw-155409v2

  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf
  xe-pw-155409v2: 155409v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/index.html

--===============8802723484562204646==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix typos and improve kernel-doc com=
ments in xe_gt (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155409/">https://patchwork.freedesktop.org/series/155409/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155409v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155409v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3872-5d520fdf951167ca881c7ebf831dedff6=
29e6ccf_FULL -&gt; xe-pw-155409v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155409v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc=
-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE=
#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_flip@2x-plain-fli=
p-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-4/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-4/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-=
tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-=
tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other t=
ests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@kms_psr@psr-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_ccs@block-multicopy-inpla=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#=
5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_create@multigpu-create-m=
assive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_eu_stall@invalid-sampling=
-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_eudebug_online@interrupt=
-other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-=
userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_fault_mode@once-basi=
c-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_exec_system_allocator@ma=
ny-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +108 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@xe_exec_system_allocator@many=
-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_exec_system_allocator@pro=
cesses-evict-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard=
-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff62=
9e6ccf/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831d=
edff629e6ccf/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7=
ebf831dedff629e6ccf/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167c=
a881c7ebf831dedff629e6ccf/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf9=
51167ca881c7ebf831dedff629e6ccf/shard-dg2-435/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d5=
20fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-38=
72-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831dedff629e=
6ccf/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf831ded=
ff629e6ccf/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca881c7ebf=
831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf951167ca88=
1c7ebf831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520fdf9511=
67ca881c7ebf831dedff629e6ccf/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-5d520f=
df951167ca881c7ebf831dedff629e6ccf/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3872-=
5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155409v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55409v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155409v2/shard-dg2-434/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-155409v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155409v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/=
shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155409v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2=
/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-3/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-3/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5244">Intel XE#5244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_oa@rc6-disable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">=
Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pxp@display-black-pxp-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-=
rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-6/igt@xe_pxp@pxp-termination-key-u=
pdate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-9/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-8=
/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-b=
mg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +4 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-=
bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55409v2/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-lnl-3/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-1/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-lnl-1/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-l=
nl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard=
-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race.html=
">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155409v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-mmap-new-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#=
5893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155409v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_se=
nd_recv.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155409v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#27=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/311=
3">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-bmg-2/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155409v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 o=
ther test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
409v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v=
2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55409v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155409v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155409v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v=
2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/sha=
rd-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-2/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2=
/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155409v2/shard-bmg-3/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf/shard-adlp-9/igt@xe_srio=
v_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155409v2/shard-adlp-=
9/igt@xe_sriov_scheduling@equal-throughput.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>) +1=
 other test abort</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -&gt; xe-pw-155=
409v2</li>
</ul>
<p>IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7eb=
f831dedff629e6ccf<br />
  xe-pw-155409v2: 155409v2</p>

</body>
</html>

--===============8802723484562204646==--
