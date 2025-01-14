Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E3C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 16:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A6310E3E3;
	Tue, 14 Jan 2025 16:23:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733C310E3DD;
 Tue, 14 Jan 2025 16:23:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7956958625814942340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/xe3=3A_FBC_Dirty_?=
 =?utf-8?q?rect_feature_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 16:23:16 -0000
Message-ID: <173687179645.3646162.7863053613758655073@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114120719.191372-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250114120719.191372-1-vinod.govindapillai@intel.com>
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

--===============7956958625814942340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3: FBC Dirty rect feature support (rev3)
URL   : https://patchwork.freedesktop.org/series/141526/
State : failure

== Summary ==

CI Bug Log - changes from xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab_full -> xe-pw-141526v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141526v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141526v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141526v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in xe-pw-141526v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][4] -> [FAIL][5] ([Intel XE#3908]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +104 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#787]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3124]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#314]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#373]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2390])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#307])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#3304])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#1188])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#308])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2291])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#323])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#3820]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2316]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1421])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#310]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][48] -> [FAIL][49] ([Intel XE#2882] / [Intel XE#3820])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#301]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#301]) +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#2882])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#2953]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#2882])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#886]) +2 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397] / [Intel XE#1745])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#651]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2312]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#2333]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#651])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#651]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#653]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2313])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][75] -> [ABORT][76] ([Intel XE#2625])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@kms_hdr@bpc-switch-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][77] ([Intel XE#4048])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2934])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#324]) +5 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-5/igt@kms_plane@plane-position-covered.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#324]) +21 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#616]) +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2763]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1489])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1489]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1122])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#929])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1435])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1435])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1435]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#3889])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@connect-user:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2905]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2905]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2905])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][99] -> [TIMEOUT][100] ([Intel XE#1473] / [Intel XE#402])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#1000])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-1/igt@xe_evict@evict-threads-large.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-1/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1392])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#288]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#288])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [FAIL][111] ([Intel XE#3099]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1192] / [Intel XE#3026])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2284] / [Intel XE#366])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2284])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [PASS][117] -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1794])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][119] -> [ABORT][120] ([Intel XE#1358] / [Intel XE#1607])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][121] -> [ABORT][122] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) +1 other test abort
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#958])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#944])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#944])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#1033]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][129] -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][131] ([Intel XE#2291]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][133] ([Intel XE#1475]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][135] ([Intel XE#2425]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][137] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#301]) -> [PASS][140] +6 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][141] ([Intel XE#2316]) -> [PASS][142] +3 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [INCOMPLETE][145] ([Intel XE#2049]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][147] ([Intel XE#886]) -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#2882]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [FAIL][151] ([Intel XE#2882]) -> [PASS][152] +3 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][153] -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][155] ([Intel XE#3012]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][157] ([Intel XE#2571]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_sequence@get-forked:
    - shard-bmg:          [INCOMPLETE][159] -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_sequence@get-forked.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_sequence@get-forked.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#2953]) -> [PASS][162] +5 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
    - shard-dg2-set2:     [ABORT][163] ([Intel XE#2625] / [Intel XE#4057]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1392]) -> [PASS][166] +4 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [SKIP][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192]) ([Intel XE#378]) -> ([PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][218] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][220] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][222] ([Intel XE#1178]) -> [INCOMPLETE][223] ([Intel XE#2715]) +1 other test incomplete
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_content_protection@atomic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][224] ([Intel XE#1178]) -> [SKIP][225] ([Intel XE#2341])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][226] ([Intel XE#2341]) -> [FAIL][227] ([Intel XE#1178])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_content_protection@legacy.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][228] ([Intel XE#2341]) -> [FAIL][229] ([Intel XE#1188])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_content_protection@uevent.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][230] ([Intel XE#877]) -> [SKIP][231] ([Intel XE#2291])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][232] ([Intel XE#2882]) -> [SKIP][233] ([Intel XE#2316])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][234] ([Intel XE#2312]) -> [SKIP][235] ([Intel XE#2311]) +11 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][236] ([Intel XE#2312]) -> [FAIL][237] ([Intel XE#2333]) +6 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][238] ([Intel XE#2333]) -> [SKIP][239] ([Intel XE#2312]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#2312]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [SKIP][243] ([Intel XE#2313]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][244] ([Intel XE#2313]) -> [SKIP][245] ([Intel XE#2312]) +9 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][246] ([Intel XE#1473]) -> [INCOMPLETE][247] ([Intel XE#1473]) +1 other test incomplete
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][248] ([Intel XE#1473]) -> [TIMEOUT][249] ([Intel XE#1473])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][250] ([Intel XE#1473] / [Intel XE#2472]) -> [INCOMPLETE][251] ([Intel XE#1473])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][252] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][253] ([Intel XE#1000])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][254] ([Intel XE#1192]) -> [FAIL][255] ([Intel XE#3099])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][256] ([Intel XE#2833]) -> [SKIP][257] ([Intel XE#1192])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab -> xe-pw-141526v3

  IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab: 637fb849e35fb66d1acdface4708b8a54a093eab
  xe-pw-141526v3: 141526v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/index.html

--===============7956958625814942340==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3: FBC Dirty rect feature support=
 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141526/">https://patchwork.freedesktop.org/series/141526/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141526v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141526v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2481-637fb849e35fb66d1acdface4708b8a54=
a093eab_full -&gt; xe-pw-141526v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141526v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-141526v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1415=
26v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank@d-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@fl=
ip-vs-expired-vblank@d-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141526v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/s=
hard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_bw@linear-tiling-3-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-=
a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-=
a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_chamelium_edid@dp-mode-t=
imings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edi=
d-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-435/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_cursor_crc@cursor-onscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_cursor_crc@cursor-rando=
m-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3820">Intel XE#3820</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_flip@2x-wf_vblank-ts-che=
ck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-7/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#382=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-433/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_flip@flip-vs-expired-vb=
lank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank@c-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@flip-v=
s-expired-vblank@c-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_fl=
ip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_flip@plain-fl=
ip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-434/igt@kms_fl=
ip@plain-flip-fb-recreate@c-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_fli=
p@plain-flip-fb-recreate@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-3/igt@kms_=
flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test sk=
ip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-move.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@kms_hd=
r@bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_hdr@bpc-switch-sus=
pend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@=
pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-5/igt@kms_plan=
e@plane-position-covered.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-6/igt@kms_plane@plane-posi=
tion-covered.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-4/igt@kms_plan=
e@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-4/igt@kms=
_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324<=
/a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@kms_psr@psr2-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_eudebug@connect-user.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_eudebug@multigpu-basic-cli=
ent-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_eudebug_online@reset-wit=
h-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@xe_evi=
ct@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_e=
vict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE=
#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_evict@evict-beng-small-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-1/igt@xe_evict=
@evict-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-1/igt@xe_evict@evict-threads-l=
arge.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shar=
d-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-ex=
ec-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@xe_exec_fault_mode@once-use=
rptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3099">Intel XE#3099</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_oa@buffer-fill.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@xe_pm@=
s4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141526v3/shard-dg2-432/igt@xe_pm@s4-basic-exec.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358=
">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-7/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141526v3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-6/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-4/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141526v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-436/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-434/igt@=
kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-8/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#=
2882</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
820">Intel XE#3820</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141526v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141526v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_flip@fl=
ip-vs-expired-vblank@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-lnl-7/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-lnl-8/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@kms_fli=
p@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-4=
36/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-b=
mg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">PASS</a> +3 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-433/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2-436/=
igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html">PASS</a> +3 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_sequ=
ence@get-forked.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_sequence@get-forked=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/=
igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +5 other tests pass</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@kms_vb=
lank@ts-continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/sha=
rd-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-=
dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093ea=
b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a=
093eab/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b=
8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface=
4708b8a54a093eab/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1ac=
dface4708b8a54a093eab/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb6=
6d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e=
35fb66d1acdface4708b8a54a093eab/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637f=
b849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481=
-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093ea=
b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a=
093eab/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b=
8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface=
4708b8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1ac=
dface4708b8a54a093eab/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb6=
6d1acdface4708b8a54a093eab/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1415=
26v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-a=
dlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-141526v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141526v3/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/sh=
ard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141526v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141526v3/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526=
v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141526v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41526v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141526v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shar=
d-adlp-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-dg2-432/igt@xe_pm@=
s2idle-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-dg2=
-432/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-adlp-9/igt@xe_pm@s=
4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-adlp-3/igt@xe=
_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-3/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141526v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
526v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41526v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#=
2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1415=
26v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41526v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-b=
mg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel=
 XE#1473</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg=
-8/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-4/igt@xe_evict=
@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v=
3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">I=
ntel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-4/igt@xe_evict=
@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/sha=
rd-bmg-8/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-5/igt@xe_live_ktest@xe_bo=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3099">Intel XE#3099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/shard-bmg-3/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/shard-bmg-6/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab -&gt; xe-pw-141=
526v3</li>
</ul>
<p>IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab: 637fb849e35fb66d1acdfac=
e4708b8a54a093eab<br />
  xe-pw-141526v3: 141526v3</p>

</body>
</html>

--===============7956958625814942340==--
