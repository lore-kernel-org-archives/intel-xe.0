Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9751CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 07:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82610E6D7;
	Wed, 22 Oct 2025 07:56:56 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25010E6C9;
 Wed, 22 Oct 2025 07:56:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5174558808576668554=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_support_for_?=
 =?utf-8?q?Crescent_Island?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 07:56:55 -0000
Message-ID: <176111981510.40857.12573321909828670821@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
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

--===============5174558808576668554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add support for Crescent Island
URL   : https://patchwork.freedesktop.org/series/156297/
State : failure

== Summary ==

CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -> xe-pw-156297v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156297v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156297v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156297v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  
#### Warnings ####

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-adlp:         [SKIP][2] ([Intel XE#4519]) -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebug.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebug.html

  
Known issues
------------

  Here are the changes found in xe-pw-156297v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#3718] / [Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#6078])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#6054]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#619])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][18] ([Intel XE#4345])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#3862]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#373]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#1475]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#4633])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2244])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#301])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#301])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#4543]) +11 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301] / [Intel XE#3321])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#4543] / [Intel XE#5208]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#4543])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#6312])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#5390]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2313]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#1503])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2927])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#3012])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2391])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1127])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#3414] / [Intel XE#3904])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#4459]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4837]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4837]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#6321])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2322]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][75] -> [WARN][76] ([Intel XE#5786])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4915]) +46 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_exec_system_allocator@many-stride-malloc-race.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#5625])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4943]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2457])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2284] / [Intel XE#366])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#944])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4130])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][85] -> [DMESG-FAIL][86] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [DMESG-WARN][87] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][89] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][93] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][95] ([Intel XE#2291]) -> [PASS][96] +4 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][97] ([Intel XE#4354]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][99] ([Intel XE#2316]) -> [PASS][100] +6 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][101] ([Intel XE#4543]) -> [PASS][102] +6 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][103] ([Intel XE#301]) -> [PASS][104] +2 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][105] ([Intel XE#1503]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][107] ([Intel XE#4596]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#6321]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][111] ([Intel XE#3876]) -> [PASS][112] +2 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-null-defer-bind:
    - shard-bmg:          [DMESG-WARN][113] ([Intel XE#3876]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-bmg:          [FAIL][115] ([Intel XE#5625]) -> [PASS][116] +3 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][117] ([Intel XE#6050]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [FAIL][119] ([Intel XE#6325]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
    - shard-bmg:          [FAIL][121] ([Intel XE#4937] / [Intel XE#5625]) -> [PASS][122] +32 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          [TIMEOUT][123] ([Intel XE#3876] / [Intel XE#6162]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [DMESG-FAIL][125] ([Intel XE#5545]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [FAIL][127] ([Intel XE#5545]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - shard-bmg:          [INCOMPLETE][129] ([Intel XE#4842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#4543]) -> [DMESG-WARN][132] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][133] ([Intel XE#2341]) -> [FAIL][134] ([Intel XE#1178])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][135] ([Intel XE#4543] / [Intel XE#4921]) -> [DMESG-FAIL][136] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][137] ([Intel XE#4543]) -> [FAIL][138] ([Intel XE#1874])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#2311]) -> [SKIP][140] ([Intel XE#2312]) +9 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][141] ([Intel XE#2312]) -> [SKIP][142] ([Intel XE#2311]) +13 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][143] ([Intel XE#2312]) -> [SKIP][144] ([Intel XE#5390]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][145] ([Intel XE#5390]) -> [SKIP][146] ([Intel XE#2312]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [SKIP][148] ([Intel XE#2313]) +13 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][149] ([Intel XE#2313]) -> [SKIP][150] ([Intel XE#2312]) +9 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][151] ([Intel XE#2426]) -> [FAIL][152] ([Intel XE#1729])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#362]) -> [SKIP][154] ([Intel XE#1500])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][155] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][156] ([Intel XE#5530])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -> xe-pw-156297v1

  IGT_8594: 8594
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
  xe-pw-156297v1: 156297v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/index.html

--===============5174558808576668554==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add support for Crescent Island</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156297/">https://patchwork.freedesktop.org/series/156297/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -&gt; xe-pw-156297v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156297v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156297v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156297v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_eudebug_sriov@deny-eudebug:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156297v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_exec_system_allocator@many-stride-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050">Intel XE#6050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325">Intel XE#6325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162">Intel XE#6162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156297v1/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -&gt; xe-pw-156297v1</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687<br />
  xe-pw-156297v1: 156297v1</p>

</body>
</html>

--===============5174558808576668554==--
