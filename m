Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657FBC02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 17:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A510E1F6;
	Wed,  5 Feb 2025 17:04:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035710E0F6;
 Wed,  5 Feb 2025 17:04:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7488993559621826135=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Don=27t_treat_SR?=
 =?utf-8?q?-IOV_platforms_as_reclaim_unsafe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 17:04:12 -0000
Message-ID: <173877505287.1534803.3974260777427551466@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205120150.896-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250205120150.896-1-michal.wajdeczko@intel.com>
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

--===============7488993559621826135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
URL   : https://patchwork.freedesktop.org/series/144369/
State : failure

== Summary ==

CI Bug Log - changes from xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721_full -> xe-pw-144369v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144369v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144369v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144369v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_module_load@many-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_module_load@many-reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-144369v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@fbdev@info.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#2594])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#1033])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2191])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +76 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#4208] / [i915#2575]) +38 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#373]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2321])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#4172]) +30 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][29] ([Intel XE#1033]) +8 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2291]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#4208] / [i915#2575]) +74 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#301]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1421]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#886]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#3321]) +3 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#2882])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#1033]) +2 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2311])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#455])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#3012])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-3-size-256:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][61] ([Intel XE#4172])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_plane_cursor@primary@pipe-d-hdmi-a-3-size-256.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2763]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2763]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#455])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#1430])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1439] / [Intel XE#3141])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2850] / [Intel XE#929])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#3414] / [Intel XE#3904])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2413] / [Intel XE#374])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#374]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1435])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#899])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2905])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2905])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2905]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#688]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#4208]) +155 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2322])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1392])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#4208]) +116 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#4173])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#1192])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2284] / [Intel XE#366])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#944])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#2134]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@fbdev@unaligned-read.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][96] ([Intel XE#911]) -> [PASS][97] +3 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-adlp:         [DMESG-WARN][98] -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][100] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#4208] / [i915#2575]) -> [PASS][103] +62 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][104] ([Intel XE#2291]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][106] ([Intel XE#2316]) -> [PASS][107] +7 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][108] ([Intel XE#3098]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][110] ([Intel XE#886]) -> [PASS][111] +4 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [FAIL][112] ([Intel XE#886]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301]) -> [PASS][115] +4 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][116] ([Intel XE#3321]) -> [PASS][117] +3 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][118] ([Intel XE#4172]) -> [PASS][119] +23 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][120] ([Intel XE#2953]) -> [PASS][121] +2 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][122] ([Intel XE#2882]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#4208]) -> [PASS][125] +102 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][127] +6 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][128] ([Intel XE#1503]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#4173]) -> [PASS][131] +8 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][132] ([Intel XE#616]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][134] ([Intel XE#1033]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1033]) -> [SKIP][139] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][140] ([Intel XE#1033]) -> [SKIP][141] ([Intel XE#4208])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][143] ([Intel XE#316])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [INCOMPLETE][144] -> [DMESG-WARN][145] ([Intel XE#4172])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-dg2-set2:     [INCOMPLETE][146] -> [DMESG-WARN][147] ([Intel XE#1033])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#316]) -> [SKIP][149] ([Intel XE#4208]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#4208]) -> [SKIP][151] ([Intel XE#316])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#316]) -> [SKIP][153] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1124]) -> [SKIP][155] ([Intel XE#4208]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#4208]) -> [SKIP][157] ([Intel XE#1124]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#607]) -> [SKIP][159] ([Intel XE#4208])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][161] ([Intel XE#1124]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1124]) -> [SKIP][163] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2191]) -> [SKIP][165] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#4208] / [i915#2575]) -> [SKIP][167] ([Intel XE#2191])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#4208] / [i915#2575]) -> [SKIP][169] ([Intel XE#367])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#367]) -> [SKIP][171] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][173] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#4208]) -> [SKIP][175] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][177] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#4208]) -> [SKIP][179] ([Intel XE#3442])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2907]) -> [SKIP][181] ([Intel XE#4208]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#4208]) -> [SKIP][183] ([Intel XE#2907])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][184] ([Intel XE#4010]) -> [SKIP][185] ([Intel XE#4208])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][187] ([Intel XE#4208]) +8 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#306]) -> [SKIP][189] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#4208] / [i915#2575]) -> [SKIP][191] ([Intel XE#373]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#373]) -> [SKIP][193] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#307]) -> [SKIP][195] ([Intel XE#4208] / [i915#2575])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][196] ([Intel XE#1178]) -> [SKIP][197] ([Intel XE#2341])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#455]) -> [SKIP][199] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_content_protection@lic-type-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#4208] / [i915#2575]) -> [FAIL][201] ([Intel XE#1178])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_content_protection@srm.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#308]) -> [SKIP][203] ([Intel XE#4208] / [i915#2575])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#4208] / [i915#2575]) -> [SKIP][205] ([Intel XE#308])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#323]) -> [SKIP][207] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#4208] / [i915#2575]) -> [SKIP][209] ([Intel XE#323])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2-set2:     [INCOMPLETE][210] ([Intel XE#3226]) -> [DMESG-WARN][211] ([Intel XE#1033])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][212] ([Intel XE#2291]) -> [DMESG-WARN][213] ([Intel XE#877])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#4172]) -> [SKIP][215] ([Intel XE#2291])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#4208]) -> [SKIP][217] ([Intel XE#776])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#701]) -> [SKIP][219] ([Intel XE#4208] / [i915#2575])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#4172]) -> [SKIP][221] ([Intel XE#2316])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#2955]) -> [DMESG-WARN][223] ([Intel XE#4172])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][224] ([Intel XE#2955]) -> [DMESG-WARN][225] ([Intel XE#1033]) +1 other test dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208]) -> [SKIP][227] ([Intel XE#455]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#455]) -> [SKIP][229] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][231] ([Intel XE#455])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#455]) -> [SKIP][233] ([Intel XE#4208]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][235] ([Intel XE#651]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][236] ([Intel XE#2312]) -> [SKIP][237] ([Intel XE#2311]) +13 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2311]) -> [SKIP][239] ([Intel XE#2312]) +22 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][240] ([Intel XE#2312]) -> [SKIP][241] ([Intel XE#4141]) +6 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#4141]) -> [SKIP][243] ([Intel XE#2312]) +12 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#651]) -> [SKIP][245] ([Intel XE#4208]) +18 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [SKIP][247] ([Intel XE#651]) +16 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#651]) -> [SKIP][249] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#653]) -> [SKIP][251] ([Intel XE#4208]) +20 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][253] ([Intel XE#653]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#4208]) -> [SKIP][255] ([Intel XE#653]) +13 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][256] ([Intel XE#2312]) -> [SKIP][257] ([Intel XE#2313]) +16 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#653]) -> [SKIP][259] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][260] ([Intel XE#2313]) -> [SKIP][261] ([Intel XE#2312]) +21 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][262] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][263] ([Intel XE#3544])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][264] ([Intel XE#616]) -> [DMESG-FAIL][265] ([Intel XE#1033])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208] / [i915#2575]) -> [SKIP][267] ([Intel XE#455]) +5 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][268] ([Intel XE#4212]) -> [SKIP][269] ([Intel XE#4208] / [i915#2575])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4208] / [i915#2575]) -> [SKIP][271] ([Intel XE#2763] / [Intel XE#455])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#870]) -> [SKIP][273] ([Intel XE#4208])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [SKIP][275] ([Intel XE#2938])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][277] ([Intel XE#1122])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1129]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][281] ([Intel XE#908])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1129]) -> [SKIP][283] ([Intel XE#2351] / [Intel XE#4208])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1489]) -> [SKIP][285] ([Intel XE#4208]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#1489]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1122]) -> [SKIP][289] ([Intel XE#4208])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#4208]) -> [SKIP][291] ([Intel XE#1122])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][293] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208]) -> [SKIP][295] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][297] ([Intel XE#2351] / [Intel XE#4208])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][299] ([Intel XE#4208]) +11 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_psr@psr2-basic.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2939]) -> [SKIP][301] ([Intel XE#4208])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#3414]) -> [SKIP][303] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1127]) -> [SKIP][305] ([Intel XE#4208] / [i915#2575])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#4208] / [i915#2575]) -> [SKIP][307] ([Intel XE#1500])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2168]) -> [SKIP][309] ([Intel XE#4208] / [i915#2575])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_vrr@cmrr.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [INCOMPLETE][310] -> [FAIL][311] ([Intel XE#1522]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-1/igt@kms_vrr@flip-dpms.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#756]) -> [SKIP][313] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][315] ([Intel XE#4208] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][316] ([Intel XE#2705] / [Intel XE#4212]) -> [SKIP][317] ([Intel XE#4208])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@testdisplay.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@testdisplay.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1126]) -> [SKIP][319] ([Intel XE#4208])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208]) -> [SKIP][321] ([Intel XE#3889])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2905]) -> [SKIP][323] ([Intel XE#4208]) +8 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#4208]) -> [SKIP][325] ([Intel XE#2905]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#288]) -> [SKIP][327] ([Intel XE#4208]) +18 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208]) -> [SKIP][329] ([Intel XE#288]) +17 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#255]) -> [SKIP][331] ([Intel XE#4208])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#4208]) -> [SKIP][333] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][335] ([Intel XE#4208]) +5 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [SKIP][337] ([Intel XE#1337])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#977]) -> [SKIP][339] ([Intel XE#4208])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][340] ([Intel XE#1173]) -> [SKIP][341] ([Intel XE#1061] / [Intel XE#4208])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_peer2peer@read.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#4208]) -> [SKIP][343] ([Intel XE#2284] / [Intel XE#366])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [DMESG-WARN][344] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][345] ([Intel XE#4208])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pm@s3-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> [DMESG-WARN][347] ([Intel XE#1033] / [Intel XE#569])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          [ABORT][348] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#4172]) -> [ABORT][349] ([Intel XE#1358] / [Intel XE#1607])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@xe_pm@s4-basic.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [ABORT][350] ([Intel XE#1358] / [Intel XE#1607]) -> [ABORT][351] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#4172])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@xe_pm@s4-exec-after.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [ABORT][352] ([Intel XE#1358]) -> [SKIP][353] ([Intel XE#4208])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#4208]) -> [ABORT][355] ([Intel XE#1358]) +1 other test abort
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#944]) -> [SKIP][357] ([Intel XE#4208]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208]) -> [SKIP][359] ([Intel XE#944]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#3342]) -> [SKIP][361] ([Intel XE#4208])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#4208]) -> [ABORT][363] ([Intel XE#3075] / [Intel XE#3084])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721 -> xe-pw-144369v1

  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721: 5f025a38e4ddb453bfbf89d4ab37facf07427721
  xe-pw-144369v1: 144369v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/index.html

--===============7488993559621826135==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t treat SR-IOV platforms as reclaim unsafe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144369/">https://patchwork.freedesktop.org/series/144369/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721_full -&gt; xe-pw-144369v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144369v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144369v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144369v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_module_load@many-reload.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144369v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +30 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-3-size-256:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_plane_cursor@primary@pipe-d-hdmi-a-3-size-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +62 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +102 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-180.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-lnl-1/igt@kms_vrr@flip-dpms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-lnl-7/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-8/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-bmg-8/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-bmg-5/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721 -&gt; xe-pw-144369v1</li>
</ul>
<p>IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721: 5f025a38e4ddb453bfbf89d4ab37facf07427721<br />
  xe-pw-144369v1: 144369v1</p>

</body>
</html>

--===============7488993559621826135==--
