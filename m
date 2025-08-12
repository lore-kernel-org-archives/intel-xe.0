Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E0CA0EDB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 18:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFD210E62D;
	Tue, 12 Aug 2025 18:03:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008710E61F;
 Tue, 12 Aug 2025 18:03:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5775323481936121227=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/hwmon=3A_Return_ear?=
 =?utf-8?q?ly_on_power_limit_read_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: zhaoguohan@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Aug 2025 18:03:00 -0000
Message-ID: <175502178070.230813.10155726012233609378@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250812065930.15847-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20250812065930.15847-1-zhaoguohan@kylinos.cn>
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

--===============5775323481936121227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Return early on power limit read failure (rev2)
URL   : https://patchwork.freedesktop.org/series/151942/
State : failure

== Summary ==

CI Bug Log - changes from xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d_FULL -> xe-pw-151942v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151942v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151942v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151942v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-2.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-lnl-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-151942v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +153 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#2907])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#4416]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#306])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#373]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-lnl:          [PASS][22] -> [ABORT][23] ([Intel XE#5826]) +1 other test abort
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-lnl-3/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-lnl-5/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#5826])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455]) +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#1178])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#308])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][28] ([Intel XE#5397])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#309])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          NOTRUN -> [ABORT][32] ([Intel XE#5826]) +1 other test abort
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#5428])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#4302])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#4354])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#310]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2316]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#4543]) +4 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][45] -> [FAIL][46] ([Intel XE#3321]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][47] ([Intel XE#2049]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#4543])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#651]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#656]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5390]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#653]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1503])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4298])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#356])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2486])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#616]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#5020])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5750])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-33:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms@plane-33.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms@plane-33.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1489] / [Intel XE#5899])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1122] / [Intel XE#5899])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1127])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#3414])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#3414])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#362])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#455] / [Intel XE#5632])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4837]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#4837] / [Intel XE#5565]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#5563] / [Intel XE#688])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-rebind.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1392]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#1392]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#288] / [Intel XE#5561]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#288]) +7 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][92] -> [ABORT][93] ([Intel XE#5729])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4943])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#4915]) +70 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4915]) +65 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][97] -> [DMESG-WARN][98] ([Intel XE#5893])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2229])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#5100])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_oa@map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#3573])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#3573])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2838] / [Intel XE#979])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#944])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#944])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][107] ([Intel XE#4543]) -> [PASS][108] +6 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][109] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][111] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][113] ([Intel XE#5545]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][115] ([Intel XE#5545]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][117] ([Intel XE#5908]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][119] ([Intel XE#2291]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][121] ([Intel XE#3009]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_dp_aux_dev.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][123] ([Intel XE#2316]) -> [PASS][124] +3 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#5208]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][128] +5 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#4543]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][131] ([Intel XE#3012]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1392]) -> [PASS][134] +7 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#3876]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
    - shard-bmg:          [TIMEOUT][137] ([Intel XE#5686]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][139], [PASS][140], [PASS][141], [SKIP][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-6/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-6/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-6/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@load.html

  * {igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1}:
    - shard-bmg:          [ABORT][190] ([Intel XE#3970]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][194] ([Intel XE#1178]) -> [SKIP][195] ([Intel XE#2341])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_content_protection@srm.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][196] ([Intel XE#1475]) -> [FAIL][197] ([Intel XE#4633])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#2311]) -> [SKIP][199] ([Intel XE#2312]) +13 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][200] ([Intel XE#2312]) -> [SKIP][201] ([Intel XE#2311]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][202] ([Intel XE#5390]) -> [SKIP][203] ([Intel XE#2312]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#5390]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +11 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#2312]) +11 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][210] ([Intel XE#5021]) -> [SKIP][211] ([Intel XE#4596])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         [ABORT][212] ([Intel XE#5826]) -> [SKIP][213] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@kms_psr@fbc-psr-dpms.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_psr@fbc-psr-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5397
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
  [Intel XE#5686]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5686
  [Intel XE#5729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5729
  [Intel XE#5750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750
  [Intel XE#5826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#5908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5908
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d -> xe-pw-151942v2

  IGT_8492: 1e6c0d07b83cde9f2300b193f441c37d9dde5981 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d: c95d955cf0a032f2be77e6b07a3753bcc0f6915d
  xe-pw-151942v2: 151942v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/index.html

--===============5775323481936121227==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Return early on power limit re=
ad failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151942/">https://patchwork.freedesktop.org/series/151942/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151942v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151942v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3534-c95d955cf0a032f2be77e6b07a3753bcc=
0f6915d_FULL -&gt; xe-pw-151942v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151942v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151942v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1519=
42v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_concurrent@multi-plane-=
atomic-lowres@pipe-a-hdmi-a-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-435/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-lnl-2/igt@runner@aborted.html">FAIL</a>=
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151942v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_chamelium_color@ctm-max=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edi=
d-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_chamelium_frames@hdmi-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-lnl-3/igt@kms_conc=
urrent@multi-plane-atomic-lowres.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-lnl-5/igt@kms_concurre=
nt@multi-plane-atomic-lowres.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>) +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_concurrent@multi-plane-=
atomic-lowres@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_content_protection@atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-435/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_crc@cursor-offscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend=
@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5397">Intel XE#5397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_cursor_legacy@2x-nonbloc=
king-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_cursor_legacy@forked-bo.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5826">Intel XE#5826</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-suspend-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@kms_flip@basi=
c-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recrea=
te.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-434/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_pm_=
rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@kms_pm_rpm@univers=
al-planes-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750">Intel XE#5750</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-33:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_pm_=
rpm@universal-planes-dpms@plane-33.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@kms_pm_rp=
m@universal-planes-dpms@plane-33.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@kms_psr@psr-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_psr@psr2-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_rotation_crc@sprite-rota=
tion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_compute_preempt@compute-p=
reempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5632">Intel XE#5632</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-me=
tadata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_eudebug@vma-ufence-faultab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5565">Intel XE#5565</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_evict@evict-small.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/261=
">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5563">Intel XE#5563</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-ex=
ec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Inte=
l XE#5561</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_exec_reset@gt-rese=
t-stress.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5729">Intel XE#5729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-nomemset:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-mmap-free-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +70 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +65 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-4=
35/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-o=
bject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_oa@map-oa-buffer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573=
">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-bmg-2/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151942v2/shard-dg2-463/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151942v2/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c=
-hdmi-a-1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151942v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151942v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cur=
sor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@k=
ms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/sh=
ard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5908">Intel XE#5908</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/sh=
ard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151942v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2=
/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151942v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a=
-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-1=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +7 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-4/igt@xe_exec_=
system_allocator@many-execqueues-malloc-mlock-nomemset.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5686">Intel X=
E#5686</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151942v2/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-malloc-=
mlock-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-ad=
lp-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915=
d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0=
f6915d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a375=
3bcc0f6915d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b0=
7a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be7=
7e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032=
f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf=
0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d=
955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534=
-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915=
d/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0=
f6915d/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b07a375=
3bcc0f6915d/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be77e6b0=
7a3753bcc0f6915d/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032f2be7=
7e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3534-c95d955cf0a032=
f2be77e6b07a3753bcc0f6915d/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v=
2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1942v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151942v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard=
-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151942v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151942v2/shard-adlp-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/=
shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151942v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1519=
42v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151942v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151942v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_=
video_enhance1}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3970">Intel XE#3970</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151942v2/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched=
-if-idle@engine-drm_xe_engine_class_video_enhance1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151942v2/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151942v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v=
2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51942v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1942v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d/shard-adlp-3/igt@kms_psr=
@fbc-psr-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5826">Intel XE#5826</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151942v2/shard-adlp-9/igt@kms_psr@fbc-psr=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d -&gt; xe-pw-151=
942v2</li>
</ul>
<p>IGT_8492: 1e6c0d07b83cde9f2300b193f441c37d9dde5981 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3534-c95d955cf0a032f2be77e6b07a3753bcc0f6915d: c95d955cf0a032f2be77e6b=
07a3753bcc0f6915d<br />
  xe-pw-151942v2: 151942v2</p>

</body>
</html>

--===============5775323481936121227==--
