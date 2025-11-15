Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05861CEB2C5
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 12:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A937410E29E;
	Sat, 15 Nov 2025 12:27:56 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137F010E02B;
 Sat, 15 Nov 2025 12:27:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2243285528265409630=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_expose_PAT_softw?=
 =?utf-8?q?are_table_via_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang, X" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Nov 2025 12:27:56 -0000
Message-ID: <176320967606.60064.7122583981649708367@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114224055.242690-1-x.wang@intel.com>
In-Reply-To: <20251114224055.242690-1-x.wang@intel.com>
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

--===============2243285528265409630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: expose PAT software table via debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/157558/
State : failure

== Summary ==

CI Bug Log - changes from xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e_FULL -> xe-pw-157558v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157558v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157558v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157558v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-157558v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#316])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +12 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +21 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#6168])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1727] / [Intel XE#3113])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][17] ([Intel XE#6168] / [i915#14968])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][18] ([Intel XE#1727] / [Intel XE#3113])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2724]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178]) +2 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2291])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1475])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2286])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#5428])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4354]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4331])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2244]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2373])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2316])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2316]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#4543]) +5 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-4/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2380]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2293]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2311]) +33 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6313])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2312]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#5390]) +11 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2352])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313]) +34 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#653]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1503])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6590])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#3012]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4090])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2501])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2486])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#870]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2505])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1439] / [Intel XE#836])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2234])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2330])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2413])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6503]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2426])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1499]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4837])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +19 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2322]) +11 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#5007])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-new-bo-map:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4915]) +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@xe_exec_system_allocator@many-64k-new-bo-map.html

  * igt@xe_exec_system_allocator@many-stride-mmap-free:
    - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2594] / [Intel XE#6480])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-mmap-free.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-mmap-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4943]) +24 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][79] ([Intel XE#5466] / [Intel XE#5530])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][80] -> [DMESG-WARN][81] ([Intel XE#5893])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2229])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2245])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2284]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#6255])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#6251]) +3 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4733]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#944]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][91] ([Intel XE#4543]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][93] ([Intel XE#3862]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][97] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][99] ([Intel XE#2291]) -> [PASS][100] +2 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][101] ([Intel XE#2316]) -> [PASS][102] +2 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#4543]) -> [PASS][104] +3 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][105] ([Intel XE#301]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][107] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][109] ([Intel XE#1503]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         [DMESG-WARN][111] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][112] +14 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-6/igt@kms_lease@setcrtc-implicit-plane.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-9/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][113] ([Intel XE#4596]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][115] ([Intel XE#4459]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-adlp:         [DMESG-FAIL][117] ([Intel XE#3868] / [Intel XE#3876] / [Intel XE#5213] / [Intel XE#5545]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-adlp:         [FAIL][119] -> [PASS][120] +5 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@xe_pmu@engine-activity-accuracy-50.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-2/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [FAIL][121] ([Intel XE#6251]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [DMESG-FAIL][123] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][125] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][126] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][127] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][128] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][129] ([Intel XE#2341]) -> [FAIL][130] ([Intel XE#1178])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#4543]) -> [TIMEOUT][132] ([Intel XE#4543]) +1 other test timeout
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][133] ([Intel XE#2312]) -> [SKIP][134] ([Intel XE#2311]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][135] ([Intel XE#2312]) -> [SKIP][136] ([Intel XE#5390]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][137] ([Intel XE#5390]) -> [SKIP][138] ([Intel XE#2312]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][139] ([Intel XE#2311]) -> [SKIP][140] ([Intel XE#2312]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][141] ([Intel XE#2313]) -> [SKIP][142] ([Intel XE#2312]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#2312]) -> [SKIP][144] ([Intel XE#2313]) +10 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e -> xe-pw-157558v3

  IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e: 55131df2379c7f496ac04873edebaf30aa35d65e
  xe-pw-157558v3: 157558v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/index.html

--===============2243285528265409630==
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
<tr><td><b>Series:</b></td><td>drm/xe: expose PAT software table via debugf=
s (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157558/">https://patchwork.freedesktop.org/series/157558/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157558v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157558v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4111-55131df2379c7f496ac04873edebaf30a=
a35d65e_FULL -&gt; xe-pw-157558v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157558v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157558v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1575=
58v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157558v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-1/igt@kms_big=
_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-3/igt@kms_=
big_fb@linear-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">In=
tel XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2=
-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard=
-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i915#14968</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_chamelium_hpd@vga-hpd-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-rec=
reate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_fli=
p@basic-plain-flip@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-4/igt@kms_flip@basic-=
plain-flip@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6313">Intel XE#6313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +11 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-pl=
ane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">I=
ntel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_sharpness_filter@filter-m=
odifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ex=
tended.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-1/igt@xe_exec_system_allocator@many=
-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-bo-map:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-dg2-463/igt@xe_exec_system_allocator@ma=
ny-64k-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-mmap-free.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_exe=
c_system_allocator@many-stride-mmap-free.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Inte=
l XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +24 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-4=
36/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@xe_pm@=
s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefet=
ch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6255">Intel XE#6255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57558v3/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_en=
gine_class_video_enhance0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +3 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-8/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157558v3/shard-bmg-7/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-157558v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard=
-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_fli=
p@flip-vs-dpms-on-nop@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adl=
p-4/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-7/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-3=
/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-6/igt@kms_lea=
se@setcrtc-implicit-plane.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/s=
hard-adlp-9/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> +14 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-lnl-4/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-9/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#38=
68</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/387=
6">Intel XE#3876</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-9/igt@xe_exec_b=
asic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@xe_pmu@=
engine-activity-accuracy-50.html">FAIL</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-2/igt@xe_pmu@engine-ac=
tivity-accuracy-50.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel=
 XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157558v3/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_=
xe_engine_class_copy0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-2/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel X=
E#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-adlp-2/igt@xe_sriov_scheduling=
@nonpreempt-engine-resets@numvfs-random.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157558v3/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-=
dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard-bmg-2/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/shard=
-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v=
3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57558v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3=
/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157558v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157558v3/=
shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1575=
58v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e -&gt; xe-pw-157=
558v3</li>
</ul>
<p>IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4111-55131df2379c7f496ac04873edebaf30aa35d65e: 55131df2379c7f496ac0487=
3edebaf30aa35d65e<br />
  xe-pw-157558v3: 157558v3</p>

</body>
</html>

--===============2243285528265409630==--
