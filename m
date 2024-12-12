Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CFAE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 23:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5EA10EEBE;
	Thu, 12 Dec 2024 23:18:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B03A10EE9F;
 Thu, 12 Dec 2024 23:18:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3730119849974335713=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_Con?=
 =?utf-8?q?vert_to_DRM_client_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 23:18:14 -0000
Message-ID: <173404549449.1794598.26761464600999411@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212170913.185939-1-tzimmermann@suse.de>
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
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

--===============3730119849974335713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: Convert to DRM client setup
URL   : https://patchwork.freedesktop.org/series/142499/
State : failure

== Summary ==

CI Bug Log - changes from xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc_full -> xe-pw-142499v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142499v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142499v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142499v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-parallel-userptr:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_exec_balancer@no-exec-parallel-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_exec_balancer@no-exec-parallel-userptr.html

  
#### Warnings ####

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][3] ([Intel XE#3468]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-142499v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#324]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-lnl:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#3225])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-adlp:         [PASS][10] -> [TIMEOUT][11] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][15] ([Intel XE#3468])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2325])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2341])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-size-hints:
    - shard-adlp:         [PASS][21] -> [TIMEOUT][22] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_cursor_crc@cursor-size-hints.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#877])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][25] ([Intel XE#877])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2291])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2373])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2374])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2316]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2316])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#2597] / [Intel XE#3468])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][36] ([Intel XE#3468]) +6 other tests dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][37] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][38] ([Intel XE#1727] / [Intel XE#3468])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1727] / [Intel XE#3468])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][41] ([Intel XE#1727] / [Intel XE#3468])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#3086])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#886])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2380]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#1874]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#2333]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2312]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#1430])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1435])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#899])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1091] / [Intel XE#2849])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2905]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-bmg:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#3468]) +9 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_evict@evict-cm-threads-small.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][67] ([Intel XE#3468]) +19 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][68] ([Intel XE#3343] / [Intel XE#3468])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#3467])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3086])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][73] ([Intel XE#3467] / [Intel XE#3468])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][74] ([Intel XE#1616] / [Intel XE#3468])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][75] -> [ABORT][76] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][77] -> [ABORT][78] ([Intel XE#1358] / [Intel XE#1607])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#2919] / [Intel XE#3468])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_wedged@basic-wedged.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [FAIL][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][84] ([Intel XE#3746]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][86] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][87] +2 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][88] ([Intel XE#324]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][90] ([Intel XE#2291]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][92] ([Intel XE#2882]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][94] ([Intel XE#2316]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-FAIL][96] ([Intel XE#3468]) -> [PASS][97] +7 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#3086]) -> [PASS][99] +4 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-4/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-9/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][100] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][101] +3 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][102] ([Intel XE#1874]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][104] ([Intel XE#3012]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:
    - shard-bmg:          [DMESG-WARN][106] -> [PASS][107] +4 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-bmg:          [DMESG-FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2:
    - shard-bmg:          [FAIL][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][112] ([Intel XE#899]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [DMESG-WARN][114] ([Intel XE#3468]) -> [PASS][115] +36 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [DMESG-WARN][116] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_pm@s4-exec-after.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][118] ([Intel XE#958]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][120] ([Intel XE#1033] / [Intel XE#3086]) -> [DMESG-WARN][121] ([Intel XE#1033])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][122] ([Intel XE#3468]) -> [DMESG-WARN][123] ([Intel XE#3468])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-FAIL][124] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][125] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][126] ([Intel XE#3818]) -> [FAIL][127] ([Intel XE#1231])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [FAIL][128] ([Intel XE#1874]) -> [TIMEOUT][129] ([Intel XE#1033] / [Intel XE#1727])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][130] ([Intel XE#324]) -> [FAIL][131] ([Intel XE#1231]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][133] ([Intel XE#3468])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [DMESG-WARN][134] ([Intel XE#3468]) -> [DMESG-FAIL][135] ([Intel XE#3468])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][136] ([Intel XE#1727] / [Intel XE#2597] / [Intel XE#3468]) -> [DMESG-FAIL][137] ([Intel XE#1727] / [Intel XE#3468])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][139] ([Intel XE#1727] / [Intel XE#3468])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#3468]) -> [DMESG-FAIL][141] ([Intel XE#2705] / [Intel XE#3468])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         [SKIP][142] ([Intel XE#651]) -> [TIMEOUT][143] ([Intel XE#1033] / [Intel XE#1727])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][144] ([Intel XE#3468]) -> [FAIL][145] ([Intel XE#2333])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [FAIL][146] ([Intel XE#1861]) -> [TIMEOUT][147] ([Intel XE#1033] / [Intel XE#1727])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#3468]) -> [SKIP][149] ([Intel XE#2312])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][150] ([Intel XE#2333]) -> [SKIP][151] ([Intel XE#2312]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [FAIL][153] ([Intel XE#2333]) +3 other tests fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][154] ([Intel XE#2312]) -> [SKIP][155] ([Intel XE#2311]) +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][156] ([Intel XE#2311]) -> [SKIP][157] ([Intel XE#2312]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#2313]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][160] ([Intel XE#2313]) -> [SKIP][161] ([Intel XE#2312]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-bmg:          [DMESG-WARN][162] -> [DMESG-WARN][163] ([Intel XE#3468])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_lease@lease-unleased-connector.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_lease@lease-unleased-connector.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][164] -> [FAIL][165] ([Intel XE#1000])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][166] ([Intel XE#1473]) -> [FAIL][167] ([Intel XE#1000])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [FAIL][168] ([Intel XE#1000]) -> [TIMEOUT][169] ([Intel XE#1473] / [Intel XE#2472]) +1 other test timeout
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][170] ([Intel XE#3468]) -> [INCOMPLETE][171] ([Intel XE#1473] / [Intel XE#3468])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [DMESG-WARN][172] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][173] ([Intel XE#3343])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][174] ([Intel XE#3467]) -> [DMESG-WARN][175] ([Intel XE#3467] / [Intel XE#3468])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][176] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][177] ([Intel XE#3467])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          [DMESG-WARN][178] ([Intel XE#3468]) -> [DMESG-FAIL][179] ([Intel XE#1727] / [Intel XE#3468])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_pm@s2idle-exec-after.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][180] ([Intel XE#2280] / [Intel XE#3468]) -> [DMESG-WARN][181] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#3818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -> xe-pw-142499v1

  IGT_8151: 84ede1e6f79c17acf9339b62481aa18c3141fa29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc
  xe-pw-142499v1: 142499v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/index.html

--===============3730119849974335713==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: Convert to DRM client setup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142499/">https://patchwork.freedesktop.org/series/142499/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc_full -&gt; xe-pw-142499v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142499v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142499v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142499v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@no-exec-parallel-userptr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_exec_balancer@no-exec-parallel-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_exec_balancer@no-exec-parallel-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142499v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_cursor_crc@cursor-size-hints.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_cursor_crc@cursor-size-hints.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_evict@evict-cm-threads-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_module_load@many-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#3746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-4/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-9/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_pm@s4-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818">Intel XE#3818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@kms_lease@lease-unleased-connector.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@kms_lease@lease-unleased-connector.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_pm@s2idle-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142499v1/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -&gt; xe-pw-142499v1</li>
</ul>
<p>IGT_8151: 84ede1e6f79c17acf9339b62481aa18c3141fa29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc<br />
  xe-pw-142499v1: 142499v1</p>

</body>
</html>

--===============3730119849974335713==--
