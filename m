Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC74FCFA757
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 09:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C97610E4A6;
	Tue,  8 Oct 2024 09:02:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB3410E4A6;
 Tue,  8 Oct 2024 09:02:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4588852302758033078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_Don=27t_all?=
 =?utf-8?q?ow_tile4_framebuffer_to_do_hflip_on_display20_or_greater?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 09:02:16 -0000
Message-ID: <172837813618.1202758.3291510279776234528@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
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

--===============4588852302758033078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater
URL   : https://patchwork.freedesktop.org/series/139665/
State : failure

== Summary ==

CI Bug Log - changes from xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7_full -> xe-pw-139665v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139665v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139665v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139665v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][2] -> [SKIP][3] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [PASS][4] -> [FAIL][5] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_vblank@accuracy-idle.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_vblank@accuracy-idle.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-lnl:          [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@xe_exec_basic@many-basic-defer-bind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@no-exec-null-defer-mmap:
    - shard-lnl:          [PASS][12] -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_exec_basic@no-exec-null-defer-mmap.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@xe_exec_basic@no-exec-null-defer-mmap.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-lnl:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_exec_threads@threads-hang-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_exec_threads@threads-hang-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][16] ([Intel XE#1659]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {shard-bmg}:        [PASS][18] -> [INCOMPLETE][19] +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-139665v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) +1 other test dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#1033] / [Intel XE#1727])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#1701]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1407])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1428])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1152]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#373]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-lnl:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2929]) +1 other test dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#1475])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#599]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#310])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#886]) +5 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#1874])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#651])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#651]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656]) +12 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#656]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1469])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-2:
    - shard-lnl:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#324])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2763]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2763]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#1430])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1439])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2042])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-lnl:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2932])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-32.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2893]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#2948]) +3 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#899]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#2443]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#2667])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@read-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2905]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-beng-large:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#688]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473] / [Intel XE#402])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][81] -> [TIMEOUT][82] ([Intel XE#1473])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#2754])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][86] -> [DMESG-FAIL][87] ([Intel XE#1620])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2248])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [PASS][89] -> [TIMEOUT][90] ([Intel XE#1358] / [Intel XE#1620])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#584])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][92] -> [ABORT][93] ([Intel XE#1794])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@xe_pm@s4-mocs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#944])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        [DMESG-WARN][95] ([Intel XE#1033]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][97] ([Intel XE#1426]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][99] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][101] ([Intel XE#1475]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][103] ([Intel XE#301]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - shard-lnl:          [FAIL][105] ([Intel XE#886]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][107] ([Intel XE#1204]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][109] ([Intel XE#301]) -> [PASS][110] +10 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-lnl:          [INCOMPLETE][111] ([Intel XE#2049]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][113] ([Intel XE#1874]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#455]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][117] ([Intel XE#324]) -> [PASS][118] +3 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][119] ([Intel XE#324]) -> [PASS][120] +6 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          [DMESG-WARN][121] ([Intel XE#2055]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#899]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#2159]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_pm@d3hot-basic:
    - shard-lnl:          [DMESG-WARN][127] ([Intel XE#1620]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_pm@d3hot-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-mocs:
    - shard-lnl:          [DMESG-FAIL][129] ([Intel XE#1620]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-5/igt@xe_pm@d3hot-mocs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@xe_pm@d3hot-mocs.html

  * igt@xe_vm@large-split-misaligned-binds-16777216:
    - shard-lnl:          [INCOMPLETE][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_vm@large-split-misaligned-binds-16777216.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [ABORT][133] ([Intel XE#2310]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@xe_wedged@wedged-mode-toggle.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#362]) -> [FAIL][136] ([Intel XE#1729])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7 -> xe-pw-139665v1

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7: 1f72b793ff063e3519fc58ca3f3e83854b990ee7
  xe-pw-139665v1: 139665v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html

--===============4588852302758033078==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Don&#x27;t allow tile4 framebuffer to do hflip on display20 or greater</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139665/">https://patchwork.freedesktop.org/series/139665/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7_full -&gt; xe-pw-139665v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139665v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139665v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139665v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_vblank@accuracy-idle.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-bind.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_exec_basic@no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@xe_exec_basic@no-exec-null-defer-mmap.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_exec_threads@threads-hang-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139665v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_evict@evict-beng-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-464/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_pm@d3hot-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_pm@d3hot-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-5/igt@xe_pm@d3hot-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-5/igt@xe_pm@d3hot-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-lnl-6/igt@xe_vm@large-split-misaligned-binds-16777216.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-adlp-1/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7 -&gt; xe-pw-139665v1</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2018-1f72b793ff063e3519fc58ca3f3e83854b990ee7: 1f72b793ff063e3519fc58ca3f3e83854b990ee7<br />
  xe-pw-139665v1: 139665v1</p>

</body>
</html>

--===============4588852302758033078==--
