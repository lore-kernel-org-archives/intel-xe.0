Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7303C982D8
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 03:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A81910E4BC;
	Sat, 19 Sep 2026 03:08:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317E10E04B;
 Sat, 19 Sep 2026 03:08:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8827032237832689033=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915=3A_use_string_cho?=
 =?utf-8?q?ice_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lalit Shankar Chowdhury" <lalitshankarch@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Sep 2026 03:08:38 -0000
Message-ID: <178978731864.183660.7611759376519279161@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918042325.17700-1-lalitshankarch@gmail.com>
In-Reply-To: <20260918042325.17700-1-lalitshankarch@gmail.com>
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

--===============8827032237832689033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: use string choice helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/174521/
State : failure

== Summary ==

CI Bug Log - changes from xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392_FULL -> xe-pw-174521v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174521v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174521v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174521v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@core_setmaster@master-drop-set-root.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +583 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +93 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          NOTRUN -> [SKIP][7] +173 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][8] +23 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-free-race.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][11] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14] +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][15] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][17] ([Intel XE#7679]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][19] ([Intel XE#367]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][21] ([Intel XE#2887]) -> [SKIP][22] +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][23] ([Intel XE#3432]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][25] ([Intel XE#2652]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][27] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          [SKIP][29] ([Intel XE#7358]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][31] ([Intel XE#2252]) -> [SKIP][32] +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][33] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [FAIL][35] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][37] ([Intel XE#7642]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][39] ([Intel XE#2320]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][41] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][42] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][43] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][45] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][47] ([Intel XE#8265]) -> [SKIP][48] +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][49] ([Intel XE#8586]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_feature_discovery@vrr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [FAIL][51] ([Intel XE#3098] / [Intel XE#3149]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][53] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][55] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][56] +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][57] ([Intel XE#7179]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][59] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][60] +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][61] ([Intel XE#2311]) -> [SKIP][62] +55 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][63] ([Intel XE#4141]) -> [SKIP][64] +13 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][65] ([Intel XE#7061]) -> [SKIP][66] +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][67] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][69] ([Intel XE#7399]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][71] ([Intel XE#2313]) -> [SKIP][72] +55 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][73] ([Intel XE#6901]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][75] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][77] ([Intel XE#7591]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][79] ([Intel XE#2486]) -> [SKIP][80] +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_panel_fitting@legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][81] ([Intel XE#7283]) -> [SKIP][82] +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][83] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][85] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][87] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          [SKIP][89] ([Intel XE#8854]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][91] ([Intel XE#1489]) -> [SKIP][92] +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          [SKIP][93] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][94] +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_psr@fbc-pr-no-drrs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][95] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][97] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][99] ([Intel XE#2413]) -> [SKIP][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][101] ([Intel XE#6503]) -> [SKIP][102] +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-bmg:          [SKIP][103] ([Intel XE#9271]) -> [SKIP][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_vrr@cmrr-desktop-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][105] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_vrr@flip-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [ABORT][107] ([Intel XE#8868]) -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][111] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][112] +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][113] ([Intel XE#8374]) -> [SKIP][114] +13 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          [SKIP][115] ([Intel XE#8364]) -> [SKIP][116] +27 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][117] ([Intel XE#8369]) -> [SKIP][118] +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@evict-malloc:
    - shard-bmg:          [DMESG-WARN][119] ([Intel XE#9309]) -> [SKIP][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_exec_system_allocator@evict-malloc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@evict-malloc.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-madvise:
    - shard-bmg:          [DMESG-WARN][121] -> [SKIP][122] +45 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-free-madvise.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@many-large-mmap-free-madvise.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][123] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-busy:
    - shard-bmg:          [SKIP][125] -> [DMESG-WARN][126] +47 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-new-busy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-stride-new-busy.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:
    - shard-bmg:          [SKIP][127] ([Intel XE#8378]) -> [SKIP][128] +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          [SKIP][129] ([Intel XE#9203]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_mempage_offline@inject-single-page.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          [SKIP][131] ([Intel XE#7793]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_page_reclaim@pat-index-xd.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][133] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_pat@pat-index-xelp.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][135] ([Intel XE#7590]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_pat@xa-app-transient-media-on.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][137] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][139] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_pm@d3hot-i2c.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][141] ([Intel XE#7599]) -> [SKIP][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][143] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][144] +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][145] ([Intel XE#944]) -> [SKIP][146] +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#8963]) -> [SKIP][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in xe-pw-174521v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-with-load:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#8749])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_hotunplug@hotreplug-with-load.html

  * igt@core_hotunplug@hotunplug-rescan-with-load:
    - shard-bmg:          [PASS][150] -> [SKIP][151] ([Intel XE#8749])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan-with-load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan-with-load.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][152] -> [SKIP][153] ([Intel XE#2134])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@fbdev@info.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@fbdev@info.html

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2134])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2327])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1407]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7059] / [Intel XE#7085])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#1124]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1124]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#7679])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#367])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2887]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2887]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2652]) +17 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#3432])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#9311])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2325] / [Intel XE#7358])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#7358])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2252]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#373]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#6969]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][172] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2390] / [Intel XE#6974])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#7642])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2320]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#323] / [Intel XE#6035])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#4354] / [Intel XE#7450])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#8265]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#8265])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1421])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#7178] / [Intel XE#7351])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2311]) +25 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#6312]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#4141]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#656] / [Intel XE#7905]) +10 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2313]) +25 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#7061] / [Intel XE#7356])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#7905]) +10 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#7061])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#7061]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#7865]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#7591])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#7283])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#8396]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][200] -> [FAIL][201] ([Intel XE#8399])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][202] -> [SKIP][203] ([Intel XE#8710]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#8710])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#4608])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#4608] / [Intel XE#7304])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#2893] / [Intel XE#7304])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#1489]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#1406]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#7795])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#8397])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][215] -> [FAIL][216] ([Intel XE#7397]) +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#8370])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#7482]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@xe_exec_balancer@once-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#8374]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#8374]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#8364]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#8364]) +13 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#8369])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#8378]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#8378]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#7954])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [PASS][228] -> [INCOMPLETE][229] ([Intel XE#9270])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@xe_gt_freq@freq_suspend.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#2229])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255]) -> ([PASS][256], [PASS][257], [SKIP][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281]) ([Intel XE#2457] / [Intel XE#7405])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#6964]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#6964])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][284] ([Intel XE#7793])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#7793])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#2284] / [Intel XE#7370])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [PASS][287] -> [INCOMPLETE][288] ([Intel XE#8175])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][289] ([Intel XE#7599])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][291] ([Intel XE#8339])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][292] ([Intel XE#8963])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][293] -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][295] ([Intel XE#2134]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@fbdev@unaligned-read.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][297] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][299] -> [PASS][300] +576 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][301] ([Intel XE#301]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-bmg:          [INCOMPLETE][303] -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][305] ([Intel XE#8399]) -> [PASS][306] +1 other test pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [SKIP][307] ([Intel XE#8710]) -> [PASS][308] +2 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][309] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][310] +1 other test pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-lnl:          [FAIL][311] ([Intel XE#7850]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - shard-bmg:          [DMESG-WARN][313] ([Intel XE#9309]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          [DMESG-WARN][315] -> [PASS][316] +120 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][317] ([Intel XE#9096] / [Intel XE#9297]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][319] ([Intel XE#2229]) -> [PASS][320] +1 other test pass
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [ABORT][321] ([Intel XE#8007]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@xe_module_load@force-load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_module_load@force-load.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [FAIL][323] ([Intel XE#7992]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#2370])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#2327]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#1124]) +10 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#7679])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][333] -> [SKIP][334] ([Intel XE#367]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][335] -> [SKIP][336] ([Intel XE#2887]) +15 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#3432])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][339] -> [SKIP][340] ([Intel XE#2724] / [Intel XE#7449])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cdclk@mode-transition.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][341] -> [SKIP][342] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#2252]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [SKIP][345] -> [FAIL][346] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][347] -> [SKIP][348] ([Intel XE#2390] / [Intel XE#6974])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][349] -> [SKIP][350] ([Intel XE#2320]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][351] -> [SKIP][352] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-bmg:          [SKIP][353] -> [SKIP][354] ([Intel XE#8265]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][355] -> [SKIP][356] ([Intel XE#8680])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][357] -> [SKIP][358] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#4141]) +17 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][361] -> [SKIP][362] ([Intel XE#2311]) +56 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][363] -> [SKIP][364] ([Intel XE#7061]) +5 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#2313]) +56 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][367] -> [SKIP][368] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][369] -> [SKIP][370] ([Intel XE#7283]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][371] -> [SKIP][372] ([Intel XE#2393])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][373] -> [SKIP][374] ([Intel XE#5021] / [Intel XE#7377])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][375] -> [SKIP][376] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][377] -> [SKIP][378] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_backlight@fade.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          [SKIP][379] -> [SKIP][380] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-framegap.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][381] -> [SKIP][382] ([Intel XE#7794])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][383] -> [SKIP][384] ([Intel XE#3309] / [Intel XE#7368])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][385] ([Intel XE#8710]) -> [SKIP][386] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][387] -> [SKIP][388] ([Intel XE#1489]) +6 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][389] -> [SKIP][390] ([Intel XE#2387] / [Intel XE#7429]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][391] -> [SKIP][392] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][393] -> [SKIP][394] ([Intel XE#3904] / [Intel XE#7342])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][395] -> [SKIP][396] ([Intel XE#6503]) +3 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][397] -> [SKIP][398] ([Intel XE#2509] / [Intel XE#7437])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][399] -> [SKIP][400] ([Intel XE#2450] / [Intel XE#5857])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][401] -> [SKIP][402] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_vrr@max-min.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][403] -> [SKIP][404] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][405] -> [SKIP][406] ([Intel XE#8608])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][407] -> [SKIP][408] ([Intel XE#8370]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][409] -> [SKIP][410] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][411] -> [SKIP][412] ([Intel XE#8374]) +8 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][413] -> [SKIP][414] ([Intel XE#8364]) +24 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [SKIP][415] -> [DMESG-WARN][416] ([Intel XE#9130])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][417] -> [SKIP][418] ([Intel XE#8369])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][419] -> [SKIP][420] ([Intel XE#8378]) +10 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [SKIP][421] -> [ABORT][422] ([Intel XE#8007])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          [SKIP][423] -> [SKIP][424] ([Intel XE#7793])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_page_reclaim@binds-large-split.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [SKIP][425] -> [FAIL][426] ([Intel XE#7695]) +1 other test fail
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][427] -> [SKIP][428] ([Intel XE#7590])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][429] -> [SKIP][430] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][431] -> [SKIP][432] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          [SKIP][433] -> [SKIP][434] ([Intel XE#944])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_query@multigpu-query-oa-units.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_query@multigpu-query-oa-units.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9270
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9101 -> IGT_9102
  * Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -> xe-pw-174521v2

  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ace88b107d424431392
  xe-pw-174521v2: 174521v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/index.html

--===============8827032237832689033==
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
<tr><td><b>Series:</b></td><td>drm/i915: use string choice helpers (rev2)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174521/">https://patchwork.freedesktop.org/series/174521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-174521v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174521v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d42=
4431392_FULL -&gt; xe-pw-174521v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174521v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-174521v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1745=
21v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@core_se=
tmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_setmaster@m=
aster-drop-set-root.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg=
-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SK=
IP</a> +583 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_=
system_allocator@process-many-large-execqueues-free-madvise.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/s=
hard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free=
-madvise.html">DMESG-WARN</a> +93 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@proc=
ess-many-large-malloc-race.html">SKIP</a> +173 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-free-race.html">DMESG-WARN</a> +23 other tests dmesg-wa=
rn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel =
XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-174521v2/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-=
hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
521v2/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
21v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">S=
KIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
21v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-=
7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +14 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/=
igt@kms_chamelium_color@ctm-0-50.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_cham=
elium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/i=
gt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_con=
tent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sha=
rd-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_cont=
ent_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Inte=
l XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-174521v2/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14.html=
">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/s=
hard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7=
/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sh=
ard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SK=
IP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_feat=
ure_discovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8586">Intel XE#8586</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_feature_d=
iscovery@vrr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-=
bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">In=
tel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7349">Intel XE#7349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel =
XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#71=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
4521v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-=
reflect-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Inte=
l XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-dra=
w-render.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-174521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v=
2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SK=
IP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/=
shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
521v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plf=
lip-blt.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard=
-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bm=
g-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_pla=
ne@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#72=
83</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
4521v2/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-=
clamping.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/=
igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521=
v2/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_pm_d=
c@dc5-psr-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm=
_dc@dc5-psr-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sh=
ard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SK=
IP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_psr@=
fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@km=
s_psr@fbc-pr-no-drrs.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sha=
rd-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
4521v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_shar=
pness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/s=
hard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">=
SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@kms_vrr@=
cmrr-desktop-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9271">Intel XE#9271</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_vrr@cmrr-=
desktop-mode.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_=
vrr@flip-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@sriov_ba=
sic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@s=
riov_basic@pf-unbind-with-vf-probed.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174521v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_exec_=
fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/ig=
t@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sha=
rd-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP=
</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_exec_=
reset@multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_=
exec_reset@multi-queue-cat-error.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_exec_=
system_allocator@evict-malloc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7=
/igt@xe_exec_system_allocator@evict-malloc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_exec_=
system_allocator@many-large-mmap-free-madvise.html">DMESG-WARN</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg=
-7/igt@xe_exec_system_allocator@many-large-mmap-free-madvise.html">SKIP</a>=
 +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_exec_=
system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Int=
el XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-174521v2/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-pre=
fetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-stride-new-busy.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/i=
gt@xe_exec_system_allocator@threads-many-stride-new-busy.html">DMESG-WARN</=
a> +47 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
21v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-r=
ebind.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_mempa=
ge_offline@inject-single-page.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@x=
e_mempage_offline@inject-single-page.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_page_=
reclaim@pat-index-xd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_page_re=
claim@pat-index-xd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_pat@=
pat-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2245">Intel XE#2245</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe=
_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_pat@x=
a-app-transient-media-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pat=
@xa-app-transient-media-on.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pm@d=
3cold-mocs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@xe_pm@d=
3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-=
7/igt@xe_pm@d3hot-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_prefe=
tch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_pre=
fetch_fault@prefetch-fault.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_pxp@d=
isplay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/i=
gt@xe_pxp@display-black-pxp-fb.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_wedge=
d@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@x=
e_wedged@wedged-at-any-timeout.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174521v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-with-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_hotunplug@hotreplug-with=
-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan-with-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@core_hot=
unplug@hotunplug-rescan-with-load.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@core_hotunp=
lug@hotunplug-rescan-with-load.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-174521v2/shard-bmg-7/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel X=
E#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_big_fb@linear-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_cdclk@mode-rejected-max-d=
otclock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9311">Intel XE#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_color@ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_color_pipeline=
@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-cm=
p-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut1=
d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_content_protection@atomic=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_dp_link_training@non-uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_dsc@dsc-with-output-forma=
ts-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +=
10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@pr-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-8/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel X=
E#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8710">Intel XE#8710</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
0">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_vrr@lobf-dc3co.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">=
Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-6/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_evict@evict-small-multi-q=
ueue-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-3/igt@xe_exec_balancer@once-cm-virt=
ual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372"=
>Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-8/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-=
close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_gpgpu_fill@offset-4x4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@xe_gt_fr=
eq@freq_suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9270">Intel XE#9270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d42443=
1392/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d=
424431392/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88=
b107d424431392/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9=
ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a=
59e9ace88b107d424431392/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0=
ce4a59e9ace88b107d424431392/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe0=
8bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00=
cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6=
ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-57=
80-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74521v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74521v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74521v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
174521v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174521v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-o=
p-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@xe_multigpu_svm@mgpu-coherenc=
y-fail-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-1/igt@xe_pm@s3=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-2/igt@xe_prefetch_fault@prefetch-fa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-lnl-6/igt@xe_sriov_scheduling@equal-thr=
oughput-normal-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@xe_wedged@basic-wedged.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@core_set=
master@master-drop-set-user.html">FAIL</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@core_setmaster@ma=
ster-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@fbdev@un=
aligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@fbdev@unaligned-re=
ad.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE=
#8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174521v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb=
.html">PASS</a> +576 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-5/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@kms_hdmi=
_audio_bw@suspend-mem-audio-recovery.html">INCOMPLETE</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@km=
s_hdmi_audio_bw@suspend-mem-audio-recovery.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_r=
pm@basic-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_rpm@basic-r=
te.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-ptl-6/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-p=
tl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-5/igt@xe_exec_=
reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2=
/shard-lnl-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-sys-benchmark:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-8/igt@xe_exec_=
system_allocator@prefetch-sys-benchmark.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/s=
hard-bmg-10/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.htm=
l">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm=
-many-large-execqueues-malloc-madvise.html">PASS</a> +120 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-lnl-1/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Int=
el XE#9297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-174521v2/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-inva=
lidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_live_ktest@xe_bo=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-6/igt@xe_modul=
e_load@force-load.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_module_lo=
ad@force-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sh=
ard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-p=
anels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_big_fb@linear=
-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shar=
d-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg=
-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679=
">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms=
_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_c=
cs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_cdclk@mode-transition.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cham=
elium_color@ctm-green-to-red.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_chamelium_co=
lor@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cham=
elium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-4/ig=
t@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2=
252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cont=
ent_protection@atomic-hdcp14.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_content_prot=
ection@atomic-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_content_=
protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_curs=
or_crc@cursor-offscreen-32x32.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_cursor_crc@=
cursor-offscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_cursor_crc@=
cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_dsc@=
dsc-with-bpc-formats-bigjoiner.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_dsc@dsc-wi=
th-bpc-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel X=
E#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shar=
d-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscalin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bm=
g-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
41">Intel XE#4141</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@k=
ms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/i=
gt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel =
XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
13">Intel XE#2313</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/i=
gt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#=
7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plan=
e@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10=
/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Int=
el XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_plane_lowres@tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_plane_multiple@2x=
-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_pm_backligh=
t@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_b=
acklight@fade.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376=
">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_d=
c@dc3co-vpb-framegap.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-fram=
egap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel X=
E#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention=
-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@kms_pm_=
rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">=
Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/ig=
t@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#=
1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_psr2_su@page_flip-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@kms_psr@fbc-psr2-c=
ursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-1/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7=
342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_shar=
pness_filter@invalid-plane-with-filter.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@kms_sh=
arpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3/igt@k=
ms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437"=
>Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@kms_tv_load_detect@loa=
d-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2450">Intel XE#2450</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@kms_vrr@=
max-min.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-174521v2/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#14=
99</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927=
1">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_create@mult=
igpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#735=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_cw_po=
st_sync@walker-post-sync.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_cw_post_sync@wal=
ker-post-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-6/igt@xe_evict@evict-sm=
all-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard=
-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@x=
e_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-3=
/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">In=
tel XE#8364</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
reset@gt-reset-fault-injection.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_exec_reset@=
gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
reset@multi-queue-close-execqueues.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-5/igt@xe_exec_re=
set@multi-queue-close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/sh=
ard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8378">Intel XE#8378</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exe=
c_queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_fault=
_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
4521v2/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engi=
ne_group_add_exec_queue.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_page_=
reclaim@binds-large-split.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_page_reclaim@bin=
ds-large-split.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pat@p=
at-sw-hw-reset-compare.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset=
-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7695">Intel XE#7695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-2/igt@xe_pat@xa-app-trans=
ient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_pm@s2idle-d3cold-b=
asic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-10/igt@xe_pxp@pxp-sta=
le-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/shard-bmg-7/igt@xe_query=
@multigpu-query-oa-units.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174521v2/shard-bmg-9/igt@xe_query@multigpu-qu=
ery-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9101 -&gt; IGT_9102</li>
<li>Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -&gt; xe-pw-174=
521v2</li>
</ul>
<p>IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ac=
e88b107d424431392<br />
  xe-pw-174521v2: 174521v2</p>

</body>
</html>

--===============8827032237832689033==--
