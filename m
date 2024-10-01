Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3F0CE7D12
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 11:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A7810E1E1;
	Tue,  1 Oct 2024 11:56:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B23C10E154;
 Tue,  1 Oct 2024 11:56:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6857653421058664773=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_linux-next=3A_build_failure_aft?=
 =?utf-8?q?er_merge_of_the_random_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 11:56:19 -0000
Message-ID: <172778377962.1141618.10180367747210437855@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001134423.62b12a80@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
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

--===============6857653421058664773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: linux-next: build failure after merge of the random tree
URL   : https://patchwork.freedesktop.org/series/139356/
State : failure

== Summary ==

CI Bug Log - changes from xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1_full -> xe-pw-139356v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139356v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139356v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139356v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-blue-to-red:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_color@ctm-blue-to-red.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-9/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +3 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - {shard-bmg}:        [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  
Known issues
------------

  Here are the changes found in xe-pw-139356v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1125])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1033])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1701]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1659]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#607])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1512])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1195] / [Intel XE#1727])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1195]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1413])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#308])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#2577]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#309]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#309]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#703])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1135])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#310])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +9 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-lnl:          NOTRUN -> [TIMEOUT][50] ([Intel XE#1504]) +1 other test timeout
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-lnl:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#455]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#651]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#656]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1151])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#653]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#653]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1450]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1450] / [Intel XE#599])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][65] -> [DMESG-WARN][66] ([Intel XE#324]) +1 other test dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#616]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-436/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2763]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#2029])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2893])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1489])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1489]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2850])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2850]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#327])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1437])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#899]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#756])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#756])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1447])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][87] ([Intel XE#1473])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#688]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][89] -> [TIMEOUT][90] ([Intel XE#1473])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-432/igt@xe_evict@evict-threads-large.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1392])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1392]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#288]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#288]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#584])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#512])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#2541]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#977])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1061])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2284])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [PASS][101] -> [TIMEOUT][102] ([Intel XE#1358] / [Intel XE#1620])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][103] -> [ABORT][104] ([Intel XE#2211])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-463/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][105] -> [ABORT][106] ([Intel XE#1358] / [Intel XE#1607])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-7/igt@xe_pm@s4-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#944])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1033]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][110] ([Intel XE#1659]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#877]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#1195]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-lnl:          [FAIL][118] -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][120] ([Intel XE#886]) -> [PASS][121] +7 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][122] -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_event_leak@basic:
    - {shard-bmg}:        [DMESG-WARN][124] ([Intel XE#877]) -> [PASS][125] +5 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-4/igt@kms_flip_event_leak@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-8/igt@kms_flip_event_leak@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][126] ([Intel XE#899]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][128] ([Intel XE#1473]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][130] ([Intel XE#1000]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][132] ([Intel XE#2105]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@oa-formats:
    - shard-lnl:          [SKIP][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-8/igt@xe_oa@oa-formats.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-6/igt@xe_oa@oa-formats.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][136] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][138] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][140] ([Intel XE#958]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][142] ([Intel XE#2310]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][144] ([Intel XE#1242]) -> [FAIL][145] ([Intel XE#1231])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [FAIL][146] ([Intel XE#2676]) -> [DMESG-FAIL][147] ([Intel XE#1620])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2211
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2676
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 -> xe-pw-139356v1

  IGT_8043: 8043
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1
  xe-pw-139356v1: 139356v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/index.html

--===============6857653421058664773==
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
<tr><td><b>Series:</b></td><td>linux-next: build failure after merge of the random tree</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139356/">https://patchwork.freedesktop.org/series/139356/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1_full -&gt; xe-pw-139356v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139356v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139356v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139356v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_color@ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-9/igt@kms_color@ctm-blue-to-red.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139356v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-436/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-432/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-436/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-463/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2211">Intel XE#2211</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-4/igt@kms_flip_event_leak@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-8/igt@kms_flip_event_leak@basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-8/igt@xe_oa@oa-formats.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-6/igt@xe_oa@oa-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2676">Intel XE#2676</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139356v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 -&gt; xe-pw-139356v1</li>
</ul>
<p>IGT_8043: 8043<br />
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1<br />
  xe-pw-139356v1: 139356v1</p>

</body>
</html>

--===============6857653421058664773==--
