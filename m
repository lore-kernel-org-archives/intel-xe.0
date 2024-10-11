Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A8CFC61B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 08:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AEC10EA71;
	Fri, 11 Oct 2024 08:17:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0DE10E013;
 Fri, 11 Oct 2024 08:17:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2028757461783276017=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_add_system_memory_pag?=
 =?utf-8?q?e_iterator_support_to_xe=5Fres=5Fcursor_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 08:17:53 -0000
Message-ID: <172863467388.1239483.6583393843515675967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com>
In-Reply-To: <20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com>
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

--===============2028757461783276017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add system memory page iterator support to xe_res_cursor (rev2)
URL   : https://patchwork.freedesktop.org/series/139780/
State : failure

== Summary ==

CI Bug Log - changes from xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6_full -> xe-pw-139780v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139780v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139780v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139780v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_universal_plane@disable-primary-vs-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_universal_plane@disable-primary-vs-flip.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  
#### Warnings ####

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [DMESG-WARN][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][11] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@xe_pm@s3-mocs:
    - {shard-bmg}:        [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@xe_pm@s3-mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@xe_pm@s3-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-139780v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#801]) +23 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#1426]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1659])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#1874])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#1195])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +62 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#307])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#308])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#1475]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#323])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([i915#3804])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#776]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#701])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#310])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#886]) +6 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][44] ([Intel XE#324]) +1 other test dmesg-fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#1874])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#656]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#651]) +23 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#651])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#653]) +23 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2925])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#324]) +3 other tests dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#324]) +3 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1129])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#718])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1489]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2948]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#2850] / [Intel XE#929])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#327]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#327])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1123])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#2667])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2905]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1392])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@twice-basic:
    - shard-adlp:         [PASS][73] -> [TIMEOUT][74] ([Intel XE#1033]) +2 other tests timeout
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@xe_exec_basic@twice-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@xe_exec_basic@twice-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#288]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#288]) +14 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][77] ([Intel XE#2961]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#378])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2541]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][80] -> [ABORT][81] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][82] -> [ABORT][83] ([Intel XE#1358] / [Intel XE#1607])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#944]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - {shard-bmg}:        [DMESG-WARN][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][89] ([Intel XE#1701]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][91] ([Intel XE#1426]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][93] ([Intel XE#1659]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][97] ([Intel XE#1195]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [DMESG-WARN][99] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][101] -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][103] ([Intel XE#301]) -> [PASS][104] +2 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][105] ([Intel XE#301]) -> [PASS][106] +11 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][109] -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-lnl:          [FAIL][111] ([Intel XE#2957]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_flip@dpms-off-confusion-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][113] ([Intel XE#886]) -> [PASS][114] +4 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][119] ([Intel XE#1874]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][121] ([Intel XE#1503]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [DMESG-FAIL][123] ([Intel XE#324]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][125] ([Intel XE#324]) -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - {shard-bmg}:        [INCOMPLETE][127] ([Intel XE#2566]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - {shard-bmg}:        [INCOMPLETE][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#2953]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [FAIL][133] -> [PASS][134] +3 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-lnl:          [FAIL][135] ([Intel XE#2808]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][137] ([Intel XE#2948]) -> [PASS][138] +5 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [DMESG-WARN][139] ([Intel XE#2055]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_setmode@basic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#2883]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_setmode@basic@pipe-a-dp-4.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_setmode@basic@pipe-a-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][143] ([Intel XE#899]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [ABORT][145] ([Intel XE#2625]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][147] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [FAIL][149] ([Intel XE#2754]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-lnl:          [FAIL][151] ([Intel XE#2977]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_exercise_blt@fast-copy:
    - {shard-bmg}:        [INCOMPLETE][153] ([Intel XE#3028]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-7/igt@xe_exercise_blt@fast-copy.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@xe_exercise_blt@fast-copy.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-FAIL][155] ([Intel XE#1620]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][157] ([Intel XE#1794]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@large-binds-33554432:
    - shard-lnl:          [DMESG-WARN][159] -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@xe_vm@large-binds-33554432.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@xe_vm@large-binds-33554432.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][161] ([Intel XE#324]) -> [FAIL][162] ([Intel XE#1204])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][163] ([Intel XE#1231]) -> [DMESG-FAIL][164] ([Intel XE#324])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][165] ([Intel XE#1242]) -> [DMESG-FAIL][166] ([Intel XE#324])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][167] ([Intel XE#1861]) -> [TIMEOUT][168] ([Intel XE#1033])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][170] ([Intel XE#1035])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_plane@pixel-format.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#362]) -> [SKIP][172] ([Intel XE#1500])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3028
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6 -> xe-pw-139780v2

  IGT_8063: 8063
  xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6: 40eee4a1af7598f2992f9b69bfea567074d23ea6
  xe-pw-139780v2: 139780v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/index.html

--===============2028757461783276017==
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
<tr><td><b>Series:</b></td><td>drm/xe: add system memory page iterator support to xe_res_cursor (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139780/">https://patchwork.freedesktop.org/series/139780/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6_full -&gt; xe-pw-139780v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139780v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139780v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139780v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_universal_plane@disable-primary-vs-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_universal_plane@disable-primary-vs-flip.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_wedged@wedged-mode-toggle:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139780v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@xe_exec_basic@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@xe_exec_basic@twice-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_flip@dpms-off-confusion-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957">Intel XE#2957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_setmode@basic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-432/igt@kms_setmode@basic@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-5/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977">Intel XE#2977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-bmg-7/igt@xe_exercise_blt@fast-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3028">Intel XE#3028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-bmg-3/igt@xe_exercise_blt@fast-copy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-33554432:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-lnl-3/igt@xe_vm@large-binds-33554432.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-lnl-4/igt@xe_vm@large-binds-33554432.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6 -&gt; xe-pw-139780v2</li>
</ul>
<p>IGT_8063: 8063<br />
  xe-2045-40eee4a1af7598f2992f9b69bfea567074d23ea6: 40eee4a1af7598f2992f9b69bfea567074d23ea6<br />
  xe-pw-139780v2: 139780v2</p>

</body>
</html>

--===============2028757461783276017==--
