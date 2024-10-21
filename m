Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF0FD1712A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 19:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBB410E587;
	Mon, 21 Oct 2024 19:27:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4556810E585;
 Mon, 21 Oct 2024 19:27:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9212729158221304910=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/dp=3A_Add_FEC_Enable_R?=
 =?utf-8?q?etry_mechanism_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 19:27:14 -0000
Message-ID: <172953883427.1306508.3564329521983586724@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021124500.3691030-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241021124500.3691030-1-chaitanya.kumar.borah@intel.com>
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

--===============9212729158221304910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Add FEC Enable Retry mechanism (rev3)
URL   : https://patchwork.freedesktop.org/series/138964/
State : failure

== Summary ==

CI Bug Log - changes from xe-2103-784111a40e40a37100e61736dd137c72cedbdb39_full -> xe-pw-138964v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138964v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138964v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138964v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html

  
#### Warnings ####

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#3187]) -> [SKIP][12] +25 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html

  
Known issues
------------

  Here are the changes found in xe-pw-138964v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#827]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1701]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#1874])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2890]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195] / [Intel XE#1727]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1195] / [Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#2929]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_color@ctm-signed.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@kms_color@ctm-signed.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#2577]) +3 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#1475])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#1475])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#301]) +5 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#1204])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#301]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#3098])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2953])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#3086])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#1874]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#653])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-adlp:         [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#1430])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2446])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1489])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#2948]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#899])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#2667])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][72] -> [TIMEOUT][73] ([Intel XE#1473])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2105])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2905])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1192])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#958])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1130]) +9 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][82] -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#877]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][86] ([Intel XE#2436]) -> [PASS][87] +3 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-0-75@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][88] ([Intel XE#2929]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-c-edp-1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1195]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][92] ([Intel XE#301]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][94] ([Intel XE#886]) -> [PASS][95] +11 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][96] ([Intel XE#1874]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][98] ([Intel XE#1503]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#616]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [DMESG-WARN][102] -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-8/igt@kms_pm_rpm@cursor-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][104] ([Intel XE#2042]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][106] ([Intel XE#2948]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][108] ([Intel XE#899]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][110] ([Intel XE#877]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-1/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][112] ([Intel XE#1473]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][114] ([Intel XE#1473]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][116] -> [FAIL][117] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#1033]) -> [FAIL][119] ([Intel XE#1231] / [Intel XE#1242])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [TIMEOUT][120] -> [FAIL][121] ([Intel XE#1178]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_content_protection@atomic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][122] ([Intel XE#2961]) -> [TIMEOUT][123] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][124] ([Intel XE#3075] / [Intel XE#3084]) -> [DMESG-WARN][125] ([Intel XE#3075] / [Intel XE#3084])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3187]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2103-784111a40e40a37100e61736dd137c72cedbdb39 -> xe-pw-138964v3

  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2103-784111a40e40a37100e61736dd137c72cedbdb39: 784111a40e40a37100e61736dd137c72cedbdb39
  xe-pw-138964v3: 138964v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/index.html

--===============9212729158221304910==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Add FEC Enable Retry mechanism (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138964/">https://patchwork.freedesktop.org/series/138964/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2103-784111a40e40a37100e61736dd137c72cedbdb39_full -&gt; xe-pw-138964v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138964v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138964v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138964v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_lease@lease-invalid-crtc:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138964v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@kms_color@ctm-signed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-8/igt@kms_pm_rpm@cursor-dpms.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-6/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-1/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-464/igt@kms_content_protection@atomic.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138964v3/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2103-784111a40e40a37100e61736dd137c72cedbdb39 -&gt; xe-pw-138964v3</li>
</ul>
<p>IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2103-784111a40e40a37100e61736dd137c72cedbdb39: 784111a40e40a37100e61736dd137c72cedbdb39<br />
  xe-pw-138964v3: 138964v3</p>

</body>
</html>

--===============9212729158221304910==--
