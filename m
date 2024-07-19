Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD20CC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 09:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4410EB8E;
	Fri, 19 Jul 2024 09:44:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D049D10EB8D;
 Fri, 19 Jul 2024 09:44:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0784547297745866542=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_Have_xe=5Fvm_and_xe=5Fexec=5Fqu?=
 =?utf-8?q?eue_take_references_to_xef_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 09:44:36 -0000
Message-ID: <172138227682.288092.5044932182958459512@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
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

--===============0784547297745866542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Have xe_vm and xe_exec_queue take references to xef (rev4)
URL   : https://patchwork.freedesktop.org/series/135865/
State : success

== Summary ==

CI Bug Log - changes from xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077_full -> xe-pw-135865v4_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135865v4_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence}:
    - shard-lnl:          [FAIL][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * {igt@xe_oa@invalid-remove-userspace-config}:
    - shard-lnl:          [SKIP][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_oa@invalid-remove-userspace-config.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_oa@invalid-remove-userspace-config.html

  * {igt@xe_oa@rc6-disable}:
    - shard-lnl:          NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_oa@rc6-disable.html

  * {igt@xe_oa@stress-open-close}:
    - shard-lnl:          [PASS][6] -> [FAIL][7] +27 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-7/igt@xe_oa@stress-open-close.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-7/igt@xe_oa@stress-open-close.html

  * {igt@xe_oa@unprivileged-single-ctx-counters}:
    - shard-lnl:          [SKIP][8] ([Intel XE#2248]) -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-5/igt@xe_oa@unprivileged-single-ctx-counters.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  
Known issues
------------

  Here are the changes found in xe-pw-135865v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1701]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#1426]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#1426]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1659])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][20] ([Intel XE#1725])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1399]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#323])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1421]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#886]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#301]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1401] / [Intel XE#1745])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1397]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#1874]) +3 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#352])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#651]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#616])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656]) +16 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#599])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#361]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#498]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#305]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#908])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][60] ([Intel XE#2029])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1439])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1489])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1128])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1437])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#327])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#374]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1435])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#899])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#1523]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_vblank@accuracy-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#756])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1091] / [Intel XE#1201])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1447]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#688]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][80] -> [TIMEOUT][81] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1392]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][84] -> [ABORT][85] ([Intel XE#2271])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#512])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#366])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#366])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][89] -> [ABORT][90] ([Intel XE#1358] / [Intel XE#1794])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][91] -> [ABORT][92] ([Intel XE#1358] / [Intel XE#1794])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][93] -> [ABORT][94] ([Intel XE#1794]) +1 other test abort
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-lnl:          [PASS][95] -> [ABORT][96] ([Intel XE#1794])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#958])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#944])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#944])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][101] -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][103] ([Intel XE#1426]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][105] ([Intel XE#1426]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][107] ([Intel XE#1659]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][109] ([Intel XE#1874]) -> [PASS][110] +2 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * {igt@kms_plane@plane-position-covered@pipe-a-plane-1}:
    - shard-lnl:          [DMESG-FAIL][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * {igt@kms_plane@plane-position-covered@pipe-b-plane-4}:
    - shard-lnl:          [DMESG-WARN][113] -> [PASS][114] +3 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1195]) -> [PASS][116] +2 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][117] ([Intel XE#1430]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][119] ([Intel XE#1620] / [Intel XE#2042]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [DMESG-WARN][121] ([Intel XE#1620]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1:
    - shard-lnl:          [DMESG-WARN][123] ([Intel XE#1705]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][125] ([Intel XE#899]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][127] ([Intel XE#1522]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_vrr@flipline.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          [SKIP][133] -> [PASS][134] +59 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [ABORT][135] ([Intel XE#2271] / [Intel XE#2309]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [FAIL][137] ([Intel XE#2262]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-FAIL][139] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][141] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@xe_pm@s4-basic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [INCOMPLETE][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@xe_pm_residency@gt-c6-freeze.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@query-uc-fw-version-guc:
    - shard-lnl:          [SKIP][145] ([Intel XE#1130]) -> [PASS][146] +7 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_query@query-uc-fw-version-guc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_query@query-uc-fw-version-guc.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          [SKIP][147] -> [SKIP][148] ([Intel XE#599]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][149] -> [SKIP][150] ([Intel XE#1124]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][151] -> [SKIP][152] ([Intel XE#367])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-lnl:          [SKIP][153] -> [SKIP][154] ([Intel XE#1399]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          [SKIP][155] -> [SKIP][156] ([Intel XE#373]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          [SKIP][157] -> [SKIP][158] ([Intel XE#309])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          [SKIP][159] -> [SKIP][160] ([Intel XE#651]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][161] -> [SKIP][162] ([Intel XE#656]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-lnl:          [SKIP][163] -> [SKIP][164] ([Intel XE#498])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-lnl:          [SKIP][165] -> [SKIP][166] ([Intel XE#305])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          [SKIP][167] -> [SKIP][168] ([Intel XE#1406])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_psr@pr-basic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_psr@pr-basic.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          [SKIP][169] -> [SKIP][170] ([Intel XE#374] / [Intel XE#599])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          [SKIP][171] -> [SKIP][172] ([Intel XE#1435])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][174] ([Intel XE#1729])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          [SKIP][175] -> [SKIP][176] ([Intel XE#688]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          [SKIP][177] -> [SKIP][178] ([Intel XE#1392]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@close-fd:
    - shard-dg2-set2:     [ABORT][179] ([Intel XE#2273] / [Intel XE#2309]) -> [ABORT][180] ([Intel XE#2271] / [Intel XE#2309]) +1 other test abort
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-434/igt@xe_exec_reset@close-fd.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-436/igt@xe_exec_reset@close-fd.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          [SKIP][181] ([Intel XE#1130]) -> [SKIP][182] ([Intel XE#584]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
  [Intel XE#2273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273
  [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077 -> xe-pw-135865v4

  IGT_7930: 7930
  xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077: 61dd3d24657f028349a46c2f60bf2d67c90e4077
  xe-pw-135865v4: 135865v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html

--===============0784547297745866542==
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
<tr><td><b>Series:</b></td><td>Have xe_vm and xe_exec_queue take references to xef (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135865/">https://patchwork.freedesktop.org/series/135865/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077_full -&gt; xe-pw-135865v4_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135865v4_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@invalid-remove-userspace-config}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_oa@invalid-remove-userspace-config.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable}:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_oa@rc6-disable.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@stress-open-close}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-7/igt@xe_oa@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-7/igt@xe_oa@stress-open-close.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@unprivileged-single-ctx-counters}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-5/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_oa@unprivileged-single-ctx-counters.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135865v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-a-plane-1}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-b-plane-4}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-1/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a> +59 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309">Intel XE#2309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-2/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_query@query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_query@query-uc-fw-version-guc.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_psr@pr-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-dg2-434/igt@xe_exec_reset@close-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273">Intel XE#2273</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309">Intel XE#2309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-dg2-436/igt@xe_exec_reset@close-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309">Intel XE#2309</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077 -&gt; xe-pw-135865v4</li>
</ul>
<p>IGT_7930: 7930<br />
  xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077: 61dd3d24657f028349a46c2f60bf2d67c90e4077<br />
  xe-pw-135865v4: 135865v4</p>

</body>
</html>

--===============0784547297745866542==--
