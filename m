Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A62C3ABBE
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 01:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892BC10E107;
	Wed,  7 May 2025 01:52:58 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2234710E008;
 Wed,  7 May 2025 01:52:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8005032347689225737=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/ggtt=3A_Stop_relyin?=
 =?utf-8?q?g_on_GGTT_internals=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 01:52:56 -0000
Message-ID: <174658277696.52693.10777360558107557836@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505121924.921544-1-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-1-dev@lankhorst.se>
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

--===============8005032347689225737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ggtt: Stop relying on GGTT internals. (rev2)
URL   : https://patchwork.freedesktop.org/series/148602/
State : failure

== Summary ==

CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL -> xe-pw-148602v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148602v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148602v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148602v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@core_hotunplug@hotrebind.html

  * igt@kms_sequence@queue-idle@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-b-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-148602v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] ([Intel XE#3428]) +17 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#3428])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#4543])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +83 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#787]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#3442])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#373]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#307])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1424])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#309]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2291]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#4356])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#776])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#2882]) +4 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#310]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#301]) +5 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#301])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][44] ([Intel XE#2953] / [Intel XE#4173])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#886]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#2882]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401] / [Intel XE#1745])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1401])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#656]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#651]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#651]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#653]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1489])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1489]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#3414]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#4783])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_sequence@queue-idle.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle.html

  * igt@kms_sequence@queue-idle@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#4783])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-d-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#1435])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#330])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#4459]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1123])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#4837]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4837])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#688])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#261] / [Intel XE#688])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#688]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1392]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#288]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4943]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4915]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#4915]) +42 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#4929])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-lnl:          NOTRUN -> [ABORT][82] ([Intel XE#4757])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#2229])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-formats@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][86] ([Intel XE#3428]) +1 other test dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_oa@oa-formats@rcs-0.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#979])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#1173])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#4173])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@xe_pm@s2idle-mocs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-9/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2284] / [Intel XE#366])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][94] ([Intel XE#569])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][95] -> [ABORT][96] ([Intel XE#1794]) +1 other test abort
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#4733])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_pxp@display-black-pxp-fb.html

  
#### Possible fixes ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-adlp:         [SKIP][98] ([Intel XE#4618]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-adlp:         [DMESG-WARN][100] ([Intel XE#4173]) -> [PASS][101] +3 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@intel_sysfs_debugfs@xe-forcewake.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][102] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][104] ([Intel XE#2291]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][106] ([Intel XE#4302]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][108] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][110] ([Intel XE#3321]) -> [PASS][111] +5 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][112] ([Intel XE#2316]) -> [PASS][113] +8 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301]) -> [PASS][115] +3 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][116] ([Intel XE#301]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#4543]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][120] ([Intel XE#1503]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_hdr@static-swap.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][122] ([Intel XE#4596]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#3428]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][126] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_rpm@legacy-planes.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][128] ([Intel XE#1435]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:
    - shard-adlp:         [SKIP][130] ([Intel XE#4945]) -> [PASS][131] +5 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][132] -> [PASS][133] +23 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1392]) -> [PASS][135] +6 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#4423]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][138] ([Intel XE#1794]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][140] ([Intel XE#1794]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][142] -> [SKIP][143] ([Intel XE#316])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-adlp:         [SKIP][144] -> [SKIP][145] ([Intel XE#1124])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][146] ([Intel XE#4950]) -> [SKIP][147] ([Intel XE#2191])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][148] -> [SKIP][149] ([Intel XE#2907]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-adlp:         [SKIP][150] -> [SKIP][151] ([Intel XE#306])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_color@ctm-limited-range.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-adlp:         [SKIP][152] ([Intel XE#4950]) -> [SKIP][153] ([Intel XE#373])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         [SKIP][154] -> [SKIP][155] ([Intel XE#373])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         [SKIP][156] -> [SKIP][157] ([Intel XE#307])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][158] ([Intel XE#1188]) -> [SKIP][159] ([Intel XE#2341])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_content_protection@uevent.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [SKIP][160] ([Intel XE#2316]) -> [FAIL][161] ([Intel XE#2882] / [Intel XE#3333])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [SKIP][162] ([Intel XE#2316]) -> [DMESG-WARN][163] ([Intel XE#3428])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [SKIP][164] -> [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-adlp:         [SKIP][166] -> [SKIP][167] ([Intel XE#455])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#2311]) +12 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#4141]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][172] ([Intel XE#4141]) -> [SKIP][173] ([Intel XE#2312]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][174] -> [SKIP][175] ([Intel XE#651])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][176] ([Intel XE#2311]) -> [SKIP][177] ([Intel XE#2312]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][178] ([Intel XE#2351]) -> [SKIP][179] ([Intel XE#656])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#2313]) +13 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][184] -> [SKIP][185] ([Intel XE#656]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         [SKIP][186] -> [SKIP][187] ([Intel XE#653]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         [SKIP][188] -> [SKIP][189] ([Intel XE#870])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         [SKIP][190] ([Intel XE#2351]) -> [SKIP][191] ([Intel XE#1129])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][192] -> [SKIP][193] ([Intel XE#1489]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         [SKIP][194] -> [SKIP][195] ([Intel XE#2850] / [Intel XE#929])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#2850] / [Intel XE#929])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][198] ([Intel XE#1729]) -> [SKIP][199] ([Intel XE#362])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         [SKIP][200] -> [SKIP][201] ([Intel XE#1126])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-adlp:         [SKIP][202] ([Intel XE#4945]) -> [SKIP][203] ([Intel XE#4837])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eudebug_online@tdctl-parameters.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         [SKIP][204] -> [SKIP][205] ([Intel XE#688])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][206] -> [SKIP][207] ([Intel XE#1392])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][208] ([Intel XE#4945]) -> [SKIP][209] ([Intel XE#1392])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         [SKIP][210] -> [SKIP][211] ([Intel XE#288]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - shard-adlp:         [SKIP][212] -> [SKIP][213] ([Intel XE#4915]) +17 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [SKIP][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239]) ([Intel XE#2457]) -> ([DMESG-WARN][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [SKIP][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265]) ([Intel XE#2457] / [Intel XE#3428])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         [SKIP][266] -> [SKIP][267] ([Intel XE#4501])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@buffer-size.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_oa@buffer-size.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         [SKIP][268] ([Intel XE#4945]) -> [SKIP][269] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1061]) -> [FAIL][271] ([Intel XE#1173])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_peer2peer@read.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][272] -> [SKIP][273] ([Intel XE#1948])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         [SKIP][274] -> [SKIP][275] ([Intel XE#4814])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_render_copy@render-stress-1-copies.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_render_copy@render-stress-1-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4423
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -> xe-pw-148602v2

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
  xe-pw-148602v2: 148602v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/index.html

--===============8005032347689225737==
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
<tr><td><b>Series:</b></td><td>drm/xe/ggtt: Stop relying on GGTT internals.=
 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148602/">https://patchwork.freedesktop.org/series/148602/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148602v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148602v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6=
aed9ae9_FULL -&gt; xe-pw-148602v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148602v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148602v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1486=
02v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@core_hotunplug@hotrebind.htm=
l">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-=
b-dp-2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148602v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@core_hotunplug@hotreplug.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3428">Intel XE#3428</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/ig=
t@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Int=
el XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-a=
dlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-ti=
led-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +4 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-on-=
nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-int=
erruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-4/igt@kms_=
flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@k=
ms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_sequ=
ence@queue-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
783">Intel XE#4783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-=
d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4783">Intel XE#4783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148602v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_eudebug_online@interrupt-=
other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_evict@evict-beng-large-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_evict@evict-large-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_exec_system_allocator@pr=
ocess-many-large-malloc-race.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-free-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
02v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4929">Intel XE#4929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_oa@non-privileged-map-oa-=
buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_oa@oa-formats@rcs-0.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_oa@syncs-syncobj-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@xe_pm@s=
2idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148602v2/shard-adlp-9/igt@xe_pm@s2idle-mocs.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/igt@xe_pxp@display-black-pxp-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_s=
ysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-=
adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@intel_s=
ysfs_debugfs@xe-forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-6/i=
gt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148602v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148602v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148602v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard=
-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/sha=
rd-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-5/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148602v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@kms_hdr@static-swap=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-unity-scaling.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148602v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-=
unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adl=
p-6/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_=
fdinfo@parallel-utilization-single-full-load-isolation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48602v2/shard-adlp-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-loa=
d-isolation.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@many-execqueues-bindexecqueue-userptr-rebind.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adl=
p-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">PA=
SS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148602v2/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@=
s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4423">Intel XE#4423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-432/igt=
@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-2/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-lnl-1/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-1/igt@xe_pm@s4-v=
m-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big=
_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_big_fb@y-ti=
led-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big=
_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_big_fb@yf-=
tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@=
connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/s=
hard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms=
_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_color@ctm-limited-range.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_chamelium=
_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-=
2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_hpd@vga-hpd-after-hibernate.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_chame=
lium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_con=
tent_protection@dp-mst-lic-type-1.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_conten=
t_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3=
333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@kms_flip@2x=
-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-=
downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148602v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8602v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v=
2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/s=
hard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148602v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148602v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
02v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
02v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-=
adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_fr=
ontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_pm_backlight@fa=
de-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_=
dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_pm_dc@dc6-psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2=
/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
@fbc-psr2-basic.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@kms_psr@psr2-no-=
drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy=
_basic@mem-set-linear-0xfd.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_copy_basic@mem=
-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eude=
bug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe=
_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evic=
t_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/i=
gt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#6=
88</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48602v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/s=
hard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe=
_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-malloc-busy.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/sh=
ard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc=
-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4915">Intel XE#4915</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed=
9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed=
6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df=
35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72=
b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b9=
6d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040=
f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c10=
6040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c27=
6c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c=
3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-=
842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae=
9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-b=
mg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148602v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148602v2/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@b=
uffer-size.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_oa@buffer-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel=
 XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@s=
yncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_oa@sy=
ncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-dg2-464/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_rend=
er_copy@render-stress-1-copies.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148602v2/shard-adlp-2/igt@xe_render_cop=
y@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -&gt; xe-pw-148=
602v2</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d7=
2b9df35ed6aed9ae9<br />
  xe-pw-148602v2: 148602v2</p>

</body>
</html>

--===============8005032347689225737==--
