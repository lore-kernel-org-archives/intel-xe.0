Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2ECA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 14:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94E10E9FE;
	Thu, 28 Aug 2025 14:49:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA5010E9FE;
 Thu, 28 Aug 2025 14:49:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6925257517566091631=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Add_devm_rel?=
 =?utf-8?q?ease_action_to_safely_tear_down_CT_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 14:49:37 -0000
Message-ID: <175639257776.279562.1515579075354581239@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
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

--===============6925257517566091631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add devm release action to safely tear down CT (rev3)
URL   : https://patchwork.freedesktop.org/series/152870/
State : failure

== Summary ==

CI Bug Log - changes from xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308_FULL -> xe-pw-152870v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152870v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152870v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152870v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-152870v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3] ([Intel XE#4208])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-63.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#4208]) +61 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#4543]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +48 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#5354])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#4494] / [i915#3804])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#4354])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#4367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2316]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2049]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][34] -> [DMESG-WARN][35] ([Intel XE#4543]) +2 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-9/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2293] / [Intel XE#2380])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-adlp:         [PASS][39] -> [ABORT][40] ([Intel XE#2953])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#5390]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#2351] / [Intel XE#4208])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#1503])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#616]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#4208]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#4208] / [i915#2575]) +34 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2413])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#1435])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1499])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4837]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5793])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#1392]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4943]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-large-mmap-new-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4915]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@xe_exec_system_allocator@once-large-mmap-new-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#5893])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92]) -> ([PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [SKIP][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117]) ([Intel XE#2457])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-2/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-8/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-8/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-7/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-7/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4733])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#4208]) +66 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_vm@invalid-extensions.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_vm@invalid-extensions.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][121] ([Intel XE#4208]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@core_getversion@basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@core_getversion@basic.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#4208] / [i915#2575]) -> [PASS][124] +26 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][127] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][133] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136] +3 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][137] ([Intel XE#2373]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][139] ([Intel XE#2316]) -> [PASS][140] +3 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][141] ([Intel XE#4543]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-6/igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][143] ([Intel XE#301]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][145] ([Intel XE#4543]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][147] ([Intel XE#1503]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1392]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][153] ([Intel XE#5786]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [ABORT][155] ([Intel XE#5530]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pmu@engine-activity-idle:
    - shard-bmg:          [DMESG-WARN][157] ([Intel XE#5213]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_pmu@engine-activity-idle.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_pmu@engine-activity-idle.html

  * igt@xe_vm@large-userptr-binds-134217728:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#4208]) -> [PASS][160] +56 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_vm@large-userptr-binds-134217728.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_vm@large-userptr-binds-134217728.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#316]) -> [SKIP][162] ([Intel XE#2351] / [Intel XE#4208])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#4208]) -> [SKIP][164] ([Intel XE#316])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#316]) -> [SKIP][166] ([Intel XE#4208])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1124]) -> [SKIP][168] ([Intel XE#4208]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][170] ([Intel XE#1124])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1124]) -> [SKIP][172] ([Intel XE#2351] / [Intel XE#4208])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208]) -> [SKIP][174] ([Intel XE#1124]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208] / [i915#2575]) -> [SKIP][176] ([Intel XE#367])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#367]) -> [SKIP][178] ([Intel XE#4208] / [i915#2575])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][180] ([Intel XE#4208]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][182] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#4208]) -> [SKIP][184] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#4208] / [i915#2575]) -> [SKIP][186] ([Intel XE#373]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#373]) -> [SKIP][188] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][189] ([Intel XE#2341]) -> [FAIL][190] ([Intel XE#1178])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_content_protection@legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#1178]) -> [SKIP][192] ([Intel XE#4208] / [i915#2575])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208] / [i915#2575]) -> [SKIP][194] ([Intel XE#308])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#455]) -> [SKIP][196] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208]) -> [SKIP][198] ([Intel XE#455]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_dsc@dsc-fractional-bpp.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4422]) -> [SKIP][200] ([Intel XE#4208])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][202] ([Intel XE#4543]) +1 other test dmesg-warn
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#455]) -> [SKIP][204] ([Intel XE#4208])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#651]) -> [SKIP][206] ([Intel XE#4208]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208]) -> [SKIP][208] ([Intel XE#651]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2311]) +12 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#651]) -> [SKIP][212] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][213] ([Intel XE#5390]) -> [SKIP][214] ([Intel XE#2312]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#5390]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2311]) -> [SKIP][218] ([Intel XE#2312]) +17 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][220] ([Intel XE#651]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#2313]) +14 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#653]) -> [SKIP][224] ([Intel XE#4208]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2313]) -> [SKIP][226] ([Intel XE#2312]) +13 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4208]) -> [SKIP][228] ([Intel XE#653]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][230] ([Intel XE#653])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#653]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4298]) -> [SKIP][234] ([Intel XE#4208])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208] / [i915#2575]) -> [FAIL][236] ([Intel XE#616])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][237] ([Intel XE#4596]) -> [SKIP][238] ([Intel XE#5021])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208] / [i915#2575]) -> [SKIP][240] ([Intel XE#5021])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][242] ([Intel XE#1129])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][244] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][246] ([Intel XE#1406] / [Intel XE#4208]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1122] / [Intel XE#1406]) -> [SKIP][248] ([Intel XE#1406] / [Intel XE#4208])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][250] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][252] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_psr@psr-sprite-plane-move.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][254] ([Intel XE#1406] / [Intel XE#4208]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_psr@psr2-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][256] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#3414]) -> [SKIP][258] ([Intel XE#4208] / [i915#2575])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][259] ([Intel XE#2426]) -> [FAIL][260] ([Intel XE#1729])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#330]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208] / [i915#2575]) -> [SKIP][264] ([Intel XE#455]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_vrr@flipline.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [SKIP][266] ([Intel XE#1126])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#5626]) -> [SKIP][268] ([Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208]) -> [SKIP][270] ([Intel XE#4837]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#288]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#288]) -> [SKIP][274] ([Intel XE#4208]) +9 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][275] ([Intel XE#3876]) -> [DMESG-WARN][276] ([Intel XE#3876] / [Intel XE#5213])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#4837]) -> [SKIP][278] ([Intel XE#4208]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#4915]) -> [SKIP][280] ([Intel XE#4208]) +96 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#4915]) +67 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-435/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nomemset.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][283] ([Intel XE#3876]) -> [SKIP][284] ([Intel XE#4208])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#3573]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_oa@mi-rpc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#3573]) -> [SKIP][288] ([Intel XE#4208]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][290] ([Intel XE#4208])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [ABORT][291] ([Intel XE#3970]) -> [DMESG-WARN][292] ([Intel XE#3876])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4733]) -> [SKIP][294] ([Intel XE#4208]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208]) -> [SKIP][296] ([Intel XE#944])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#944]) -> [SKIP][298] ([Intel XE#4208]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4814]) -> [SKIP][300] ([Intel XE#4208])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#4814])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4130]) -> [SKIP][304] ([Intel XE#4208])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4367
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308 -> xe-pw-152870v3

  IGT_8512: 8512
  xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308: fbc5d00ef7824ebc9441a6a1efb619f149337308
  xe-pw-152870v3: 152870v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/index.html

--===============6925257517566091631==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add devm release action to safel=
y tear down CT (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152870/">https://patchwork.freedesktop.org/series/152870/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152870v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152870v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3626-fbc5d00ef7824ebc9441a6a1efb619f14=
9337308_FULL -&gt; xe-pw-152870v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152870v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152870v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1528=
70v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s2idle-basic-exec:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.htm=
l">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152870v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@core_s=
etmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@core_setmaste=
r@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_add=
fb_basic@bad-pitch-63.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_addfb_basic@bad-pi=
tch-63.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_addfb_basic@unused-pitc=
hes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-a=
dlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-=
stress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-m=
ultiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_curs=
or_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_cursor_le=
gacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4367">Intel XE#4367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-ch=
eck.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-2/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-9/igt@kms_flip@basic-=
plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_for=
ce_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_for=
ce_connector_basic@prune-stale-modes.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-=
434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_psr@psr2-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr@psr2-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ro=
tation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_rotation=
_crc@sprite-rotation-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +34 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152870v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_exec_system_allocator@many=
-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-dg2-433/igt@xe_exec_system_allocator@on=
ce-large-mmap-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-4=
63/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f14933=
7308/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f1=
49337308/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb6=
19f149337308/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1=
efb619f149337308/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441=
a6a1efb619f149337308/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc=
9441a6a1efb619f149337308/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef782=
4ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5d00e=
f7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-fbc5=
d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3626-=
fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152870v3/shard-bmg-4/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_vm@=
invalid-extensions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_vm@invalid-extensions=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) +66 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel X=
E#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152870v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152870v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2=
-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-4=
63/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-b=
mg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +3 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-2/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-6/igt@kms_fli=
p@dpms-off-confusion-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152870v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a=
-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152870v3/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eochec=
k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_exec_=
system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3=
/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontun=
map-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-2/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/sh=
ard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-4/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v=
3/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_pmu@e=
ngine-activity-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@xe_pm=
u@engine-activity-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_vm@=
large-userptr-binds-134217728.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt=
@xe_vm@large-userptr-binds-134217728.html">PASS</a> +56 other tests pass</l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@km=
s_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt=
@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@km=
s_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@k=
ms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shar=
d-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt=
@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-43=
4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
870v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shar=
d-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ch=
amelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ch=
amelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt=
@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/sh=
ard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/=
igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ds=
c@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152870v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-y=
tileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152870v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
70v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52870v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152870v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152870v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152870v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
870v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870=
v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/=
igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-d=
g2-436/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ps=
r2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152870v3/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-=
dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ps=
r@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152870v3/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Inte=
l XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ps=
r@psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870=
v3/shard-dg2-434/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg=
2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_ps=
r@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-d=
g2-436/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt=
@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-435/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_eu_=
stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_e=
u_stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_eud=
ebug@multiple-sessions.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_eud=
ebug@multiple-sessions.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-=
dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel X=
E#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-=
dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-3/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-3/igt@x=
e_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434=
/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exe=
c_system_allocator@process-many-execqueues-free-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
870v3/shard-dg2-434/igt@xe_exec_system_allocator@process-many-execqueues-fr=
ee-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_exe=
c_system_allocator@process-many-large-execqueues-mmap-new-nomemset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152870v3/shard-dg2-435/igt@xe_exec_system_allocator@process-many=
-large-execqueues-mmap-new-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +67 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_exe=
c_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-d=
g2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_oa@=
mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-436/igt@xe_oa@mi-rpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_oa@=
syncs-syncobj-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_oa@syncs=
-syncobj-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-bmg-7/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-bmg-1/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_pxp=
@display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/igt@xe_pxp@displa=
y-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_que=
ry@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/sha=
rd-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">I=
ntel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434=
/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-434/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-434/igt@xe_ren=
der_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v3/shard-dg2-435/=
igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel X=
E#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152870v3/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308 -&gt; xe-pw-152=
870v3</li>
</ul>
<p>IGT_8512: 8512<br />
  xe-3626-fbc5d00ef7824ebc9441a6a1efb619f149337308: fbc5d00ef7824ebc9441a6a=
1efb619f149337308<br />
  xe-pw-152870v3: 152870v3</p>

</body>
</html>

--===============6925257517566091631==--
