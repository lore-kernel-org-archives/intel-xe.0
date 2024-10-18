Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47915D3C537
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 04:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444210E0F5;
	Fri, 18 Oct 2024 04:39:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2210E0F5;
 Fri, 18 Oct 2024 04:39:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1564878301352372264=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Avoid_unnecessary_OOM?=
 =?utf-8?q?_kills?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 04:39:33 -0000
Message-ID: <172922637327.1280877.1657719029731405091@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
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

--===============1564878301352372264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Avoid unnecessary OOM kills
URL   : https://patchwork.freedesktop.org/series/140118/
State : failure

== Summary ==

CI Bug Log - changes from xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96_full -> xe-pw-140118v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140118v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140118v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140118v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-1/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][5] ([Intel XE#1178]) -> [DMESG-FAIL][6] +9 other tests dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-7/igt@kms_content_protection@legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - {shard-bmg}:        [FAIL][7] ([Intel XE#1188]) -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-4/igt@kms_content_protection@uevent.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [PASS][9] -> [DMESG-WARN][10] +140 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@xe_live_ktest@xe_eudebug:
    - {shard-bmg}:        [SKIP][11] ([Intel XE#2833]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - {shard-bmg}:        [PASS][13] -> [SKIP][14] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-140118v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#1033] / [Intel XE#1727])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#324]) +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#877])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +20 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#307]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#1475])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1475])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#301]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#310])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#886]) +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#651]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#656]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#651]) +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#658]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#653]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#653]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][51] -> [ABORT][52] ([Intel XE#2625]) +3 other tests abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#356])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#324]) +1 other test dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#870])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1129])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1620])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1489]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#2850] / [Intel XE#929])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#2948]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#1491])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#327])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1127])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#455]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#2443]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_vrr@flipline.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#455]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#756])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455] / [Intel XE#488])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#1050])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1126])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2905]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#261] / [Intel XE#688])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1392])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2687])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#2754])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#288]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +14 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][88] ([Intel XE#2961]) +1 other test timeout
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#1999]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2541]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2541]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@xe_oa@mi-rpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][93] -> [ABORT][94] ([Intel XE#1358] / [Intel XE#1794])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][95] -> [ABORT][96] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#944]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@fbdev@write.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#1426]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][102] ([Intel XE#2436]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][106] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#3113]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [FAIL][110] ([Intel XE#2577]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#2932]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][114] ([Intel XE#301]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][116] ([Intel XE#886]) -> [PASS][117] +2 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [DMESG-WARN][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][120] ([Intel XE#1503]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][122] ([Intel XE#324]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][124] ([Intel XE#2948]) -> [PASS][125] +3 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-7/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][126] ([Intel XE#899]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][128] ([Intel XE#1473]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@once-null-rebind:
    - shard-adlp:         [TIMEOUT][130] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][131] +5 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@xe_exec_basic@once-null-rebind.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_basic@once-null-rebind.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][134] ([Intel XE#1694]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][136] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][138] ([Intel XE#1794]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][140] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-FAIL][141] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][142] ([Intel XE#324]) -> [FAIL][143] ([Intel XE#1231])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][144] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][145] ([Intel XE#1874])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [TIMEOUT][146] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][147] ([Intel XE#1204])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][148] ([Intel XE#324]) -> [FAIL][149] ([Intel XE#1242])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][150] ([Intel XE#1035]) -> [INCOMPLETE][151] ([Intel XE#1035] / [Intel XE#1195]) +1 other test incomplete
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-3/igt@kms_plane@pixel-format.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-4/igt@kms_plane@pixel-format.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96 -> xe-pw-140118v1

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96: 3f39185434041f7c44e28efeb1521ad3dc43da96
  xe-pw-140118v1: 140118v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/index.html

--===============1564878301352372264==
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
<tr><td><b>Series:</b></td><td>drm/xe: Avoid unnecessary OOM kills</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140118/">https://patchwork.freedesktop.org/series/140118/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96_full -&gt; xe-pw-140118v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140118v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140118v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140118v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-1/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-8/igt@kms_content_protection@legacy.html">DMESG-FAIL</a> +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">DMESG-WARN</a> +140 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140118v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-7/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-7/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@xe_exec_basic@once-null-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@xe_exec_basic@once-null-rebind.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140118v1/shard-adlp-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96 -&gt; xe-pw-140118v1</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2078-3f39185434041f7c44e28efeb1521ad3dc43da96: 3f39185434041f7c44e28efeb1521ad3dc43da96<br />
  xe-pw-140118v1: 140118v1</p>

</body>
</html>

--===============1564878301352372264==--
