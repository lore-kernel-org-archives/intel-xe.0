Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B2E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 17:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D44B10F146;
	Fri,  6 Dec 2024 17:31:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76A10F144;
 Fri,  6 Dec 2024 17:31:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3894033408857958157=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Allow_VF_dire?=
 =?utf-8?q?ct_access_to_extended_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 17:31:26 -0000
Message-ID: <173350628631.3357417.3445656573485174081@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206133929.891568-1-piotr.piorkowski@intel.com>
In-Reply-To: <20241206133929.891568-1-piotr.piorkowski@intel.com>
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

--===============3894033408857958157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Allow VF direct access to extended registers
URL   : https://patchwork.freedesktop.org/series/142230/
State : failure

== Summary ==

CI Bug Log - changes from xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02_full -> xe-pw-142230v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142230v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142230v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142230v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +29 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421.html

  * igt@xe_exec_compute_mode@many-rebind:
    - shard-lnl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@xe_exec_compute_mode@many-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@xe_exec_compute_mode@many-rebind.html

  
#### Warnings ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-bmg:          [DMESG-WARN][5] ([Intel XE#3468]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  
Known issues
------------

  Here are the changes found in xe-pw-142230v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         NOTRUN -> [ABORT][7] ([Intel XE#1033] / [Intel XE#3673])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [ABORT][8] ([Intel XE#3673])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][9] ([Intel XE#1033]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_async_flips@crc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_async_flips@crc.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] ([Intel XE#3468]) +31 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_atomic@plane-invalid-params.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][14] ([Intel XE#3468] / [Intel XE#877])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#877]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178]) +4 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2286])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-bmg:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#3468]) +6 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2425])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:
    - shard-bmg:          [PASS][31] -> [DMESG-FAIL][32] ([Intel XE#2705] / [Intel XE#3468])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][33] ([Intel XE#3468]) +21 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2316]) +11 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#2882])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#3321]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#2882]) +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#3321]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2597])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][44] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2597] / [Intel XE#2635])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2311]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2313]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_getfb@getfb2-handle-protection:
    - shard-bmg:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_getfb@getfb2-handle-protection.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_getfb@getfb2-handle-protection.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#2705]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#1503])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2705] / [Intel XE#3468])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#2566] / [Intel XE#3468])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3184]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1489])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2330])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#899])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@wait-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][68] ([Intel XE#3468]) +4 other tests dmesg-fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_vblank@wait-forked@pipe-a-dp-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1499])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3343] / [Intel XE#3468])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1192])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3467]) +2 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_module_load@many-reload.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@xe_module_load@many-reload.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#944])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [DMESG-FAIL][77] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][78] +3 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [INCOMPLETE][79] ([Intel XE#1727]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][81] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][83] ([Intel XE#2291]) -> [PASS][84] +3 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][85] ([Intel XE#877]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-bmg:          [DMESG-FAIL][87] ([Intel XE#3468]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-adlp:         [DMESG-WARN][89] ([Intel XE#3086]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][91] ([Intel XE#3070]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][93] ([Intel XE#2316]) -> [PASS][94] +7 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][95] ([Intel XE#886]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][97] ([Intel XE#1503]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-bmg:          [INCOMPLETE][99] ([Intel XE#2870]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][101] ([Intel XE#771] / [Intel XE#899]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][103] ([Intel XE#899]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][105] ([Intel XE#899]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@xe_drm_fdinfo@mem-shared:
    - shard-bmg:          [DMESG-WARN][107] -> [PASS][108] +7 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_drm_fdinfo@mem-shared.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_drm_fdinfo@mem-shared.html

  * igt@xe_exec_basic@once-basic-defer-bind:
    - shard-bmg:          [DMESG-WARN][109] ([Intel XE#1727]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_exec_basic@once-basic-defer-bind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_exec_basic@once-basic-defer-bind.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [DMESG-WARN][111] ([Intel XE#3468]) -> [PASS][112] +36 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][113] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_module_load@many-reload:
    - shard-lnl:          [DMESG-WARN][115] ([Intel XE#3560]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@xe_module_load@many-reload.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][117] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][119] ([Intel XE#2280] / [Intel XE#3468]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][121] ([Intel XE#958]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [DMESG-WARN][123] ([Intel XE#3468]) -> [DMESG-WARN][124] ([Intel XE#2705] / [Intel XE#3468] / [Intel XE#877])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-FAIL][125] ([Intel XE#3468]) -> [DMESG-WARN][126] ([Intel XE#3468]) +2 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][127] ([Intel XE#3468]) -> [DMESG-FAIL][128] ([Intel XE#3468]) +1 other test dmesg-fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#3468]) -> [DMESG-FAIL][130] ([Intel XE#1727] / [Intel XE#3468])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][131] ([Intel XE#2341]) -> [FAIL][132] ([Intel XE#1178]) +2 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_content_protection@atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][133] ([Intel XE#2291]) -> [DMESG-WARN][134] ([Intel XE#877])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [DMESG-WARN][136] ([Intel XE#3468])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [DMESG-WARN][137] ([Intel XE#3468]) -> [SKIP][138] ([Intel XE#2291])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#3468]) -> [INCOMPLETE][140] ([Intel XE#1727] / [Intel XE#3468])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_draw_crc@draw-method-render.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][141] ([Intel XE#2316]) -> [DMESG-WARN][142] ([Intel XE#3468]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [DMESG-FAIL][144] ([Intel XE#3468])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][145] ([Intel XE#2882]) -> [SKIP][146] ([Intel XE#2316])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#3468]) -> [SKIP][148] ([Intel XE#2316])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][149] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][150] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][151] ([Intel XE#2312]) -> [SKIP][152] ([Intel XE#2311]) +20 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][153] ([Intel XE#2312]) -> [DMESG-FAIL][154] ([Intel XE#3468])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][155] ([Intel XE#2333]) -> [SKIP][156] ([Intel XE#2312]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][157] ([Intel XE#2312]) -> [FAIL][158] ([Intel XE#2333]) +10 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          [FAIL][159] ([Intel XE#2333]) -> [DMESG-FAIL][160] ([Intel XE#3468]) +1 other test dmesg-fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][161] ([Intel XE#2311]) -> [SKIP][162] ([Intel XE#2312]) +18 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#2312]) -> [SKIP][164] ([Intel XE#2313]) +17 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][165] ([Intel XE#2313]) -> [SKIP][166] ([Intel XE#2312]) +19 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [DMESG-FAIL][167] ([Intel XE#2705] / [Intel XE#3468]) -> [INCOMPLETE][168] ([Intel XE#1727] / [Intel XE#3452] / [Intel XE#3468])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_plane_lowres@tiling-x.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][169] ([Intel XE#3468]) -> [INCOMPLETE][170] ([Intel XE#1727] / [Intel XE#3452] / [Intel XE#3468])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3468])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-7/igt@kms_pm_rpm@cursor.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][173] ([Intel XE#1729]) -> [SKIP][174] ([Intel XE#2426])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][175] ([Intel XE#1473]) -> [FAIL][176] ([Intel XE#1000])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][177] ([Intel XE#1473]) -> [TIMEOUT][178] ([Intel XE#1473] / [Intel XE#2472])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][179] ([Intel XE#2705]) -> [DMESG-WARN][180] ([Intel XE#3468])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][181] -> [DMESG-WARN][182] ([Intel XE#3468])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][183] ([Intel XE#3467]) -> [DMESG-WARN][184] ([Intel XE#3467] / [Intel XE#3468])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          [ABORT][185] ([Intel XE#3673]) -> [ABORT][186] ([Intel XE#3468] / [Intel XE#3673])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][187] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][188] ([Intel XE#3467])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02 -> xe-pw-142230v1

  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02: 2e90353f058f2487798ad9236f0926df4ea54f02
  xe-pw-142230v1: 142230v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/index.html

--===============3894033408857958157==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Allow VF direct access to extended registers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142230/">https://patchwork.freedesktop.org/series/142230/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02_full -&gt; xe-pw-142230v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142230v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142230v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142230v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-421x421.html">DMESG-WARN</a> +29 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@xe_exec_compute_mode@many-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@xe_exec_compute_mode@many-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142230v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_atomic@plane-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_atomic@plane-invalid-params.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-protection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_getfb@getfb2-handle-protection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_getfb@getfb2-handle-protection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_vblank@wait-forked@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@mem-shared:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_drm_fdinfo@mem-shared.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_drm_fdinfo@mem-shared.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_exec_basic@once-basic-defer-bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_exec_basic@once-basic-defer-bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-5/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560">Intel XE#3560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-4/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_draw_crc@draw-method-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452">Intel XE#3452</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-8/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452">Intel XE#3452</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-7/igt@kms_pm_rpm@cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142230v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02 -&gt; xe-pw-142230v1</li>
</ul>
<p>IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02: 2e90353f058f2487798ad9236f0926df4ea54f02<br />
  xe-pw-142230v1: 142230v1</p>

</body>
</html>

--===============3894033408857958157==--
