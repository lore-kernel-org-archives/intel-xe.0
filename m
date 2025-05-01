Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8950C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 20:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D6110E0AD;
	Thu,  1 May 2025 20:50:17 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698D10E0AD;
 Thu,  1 May 2025 20:50:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9073936169172799722=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_ASID_to_rang?=
 =?utf-8?q?e_invalidation_feature_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 May 2025 20:50:16 -0000
Message-ID: <174613261666.33367.4728038871619773331@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250501173626.64481-1-stuart.summers@intel.com>
In-Reply-To: <20250501173626.64481-1-stuart.summers@intel.com>
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

--===============9073936169172799722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add ASID to range invalidation feature flag
URL   : https://patchwork.freedesktop.org/series/148520/
State : failure

== Summary ==

CI Bug Log - changes from xe-3017-f6c1312e243be48d3be219992e9256e68048316a_FULL -> xe-pw-148520v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148520v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148520v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148520v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][1] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset}:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-148520v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#827])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3428]) +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2191])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#787]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +237 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4417]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4416]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2341])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178]) +5 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1188]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1424])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2320])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2291]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4494] / [i915#3804])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2244])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#776])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2372])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1135])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2316]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2316])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3321]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401] / [Intel XE#1745])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1401])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2380]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#651])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +13 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4141]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2312]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#653])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#656]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2350])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#656]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#605])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#4838])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_hdr@bpc-switch.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#4426])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_hdr@static-swap.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#4426])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_hdr@static-swap@pipe-a-dp-4.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#1503])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4298])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#346])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#346])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][94] ([Intel XE#3428])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-2.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#616]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#599]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][97] ([Intel XE#4212])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][98] ([Intel XE#4760])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2763]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#870])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2893]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1489]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1489])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1122])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2387])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4609])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3414] / [Intel XE#3904])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#3414])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2413])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#1435])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#330])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1499]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1091] / [Intel XE#2849])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#455]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1123])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1126])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4837]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4837]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4837]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#688])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#688])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1392])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#1392]) +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1392])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2322]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#288])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#288]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2360])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc-busy:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4915]) +17 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_system_allocator@many-execqueues-malloc-busy.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4915]) +59 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#378])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165]) -> ([SKIP][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191]) ([Intel XE#378])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2541] / [Intel XE#3573])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#2284])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][196] -> [DMESG-WARN][197] ([Intel XE#4173])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#584])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#4733])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#4733])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#4733])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#944])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#944])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * {igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1}:
    - shard-lnl:          [FAIL][204] ([Intel XE#911]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-bmg:          [FAIL][206] ([Intel XE#1426]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-fencing.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][208] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][210] ([Intel XE#4928]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][212] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][214] ([Intel XE#2291]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@single-move:
    - shard-bmg:          [DMESG-WARN][216] -> [PASS][217] +2 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_cursor_legacy@single-move.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][218] -> [PASS][219] +3 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [FAIL][220] ([Intel XE#886]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][222] ([Intel XE#301]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][224] ([Intel XE#2882]) -> [PASS][225] +11 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][226] ([Intel XE#2316]) -> [PASS][227] +2 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][228] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][230] ([Intel XE#301]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_plane@plane-panning-top-left@pipe-a:
    - shard-adlp:         [DMESG-WARN][232] ([Intel XE#4173]) -> [PASS][233] +12 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@kms_plane@plane-panning-top-left@pipe-a.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-2/igt@kms_plane@plane-panning-top-left@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-adlp:         [DMESG-WARN][234] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_vblank@query-busy-hang@pipe-d-dp-2:
    - shard-bmg:          [FAIL][236] ([Intel XE#4892]) -> [PASS][237] +2 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1392]) -> [PASS][239] +7 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#3428]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][242] -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          [TIMEOUT][244] -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-6/igt@xe_oa@oa-exponents@ccs-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [INCOMPLETE][246] -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][248] ([Intel XE#1794]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][250] ([Intel XE#4817]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-2/igt@xe_pmu@gt-frequency.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][252] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][253] ([Intel XE#4543])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][254] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][255] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][256] ([Intel XE#1178]) -> [SKIP][257] ([Intel XE#2341])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][258] ([Intel XE#2321]) -> [SKIP][259] ([Intel XE#2320])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][260] ([Intel XE#2312]) -> [SKIP][261] ([Intel XE#2311]) +6 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][262] ([Intel XE#2311]) -> [SKIP][263] ([Intel XE#2312]) +15 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][264] ([Intel XE#2312]) -> [SKIP][265] ([Intel XE#4141])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][266] ([Intel XE#4141]) -> [SKIP][267] ([Intel XE#2312]) +8 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][268] ([Intel XE#2313]) -> [SKIP][269] ([Intel XE#2312]) +15 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][270] ([Intel XE#2312]) -> [SKIP][271] ([Intel XE#2313]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][272] ([Intel XE#2493]) -> [SKIP][273] ([Intel XE#4596])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][274] ([Intel XE#4596]) -> [SKIP][275] ([Intel XE#2493])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         [INCOMPLETE][276] ([Intel XE#4911]) -> [TIMEOUT][277] ([Intel XE#4911])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][278], [SKIP][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [DMESG-WARN][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [DMESG-WARN][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [SKIP][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329]) ([Intel XE#2457])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-7/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-7/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-1/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-1/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-8/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-8/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-8/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][330] ([Intel XE#1173]) -> [SKIP][331] ([Intel XE#1061])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_peer2peer@write.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4838
  [Intel XE#4892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4928
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3017-f6c1312e243be48d3be219992e9256e68048316a -> xe-pw-148520v1

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3017-f6c1312e243be48d3be219992e9256e68048316a: f6c1312e243be48d3be219992e9256e68048316a
  xe-pw-148520v1: 148520v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/index.html

--===============9073936169172799722==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add ASID to range invalidation featu=
re flag</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148520/">https://patchwork.freedesktop.org/series/148520/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148520v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148520v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3017-f6c1312e243be48d3be219992e9256e68=
048316a_FULL -&gt; xe-pw-148520v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148520v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148520v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1485=
20v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-many-large-execqueues-mmap-new-huge.html">SKIP</a> +2 other tests skip<=
/li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@twic=
e-large-mmap-free-huge-nomemset.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148520v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel =
XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_async_flips@alternate-syn=
c-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_atom=
ic_interruptible@atomic-setmode@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/i=
gt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">=
Intel XE#3428</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/=
igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#=
367</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +237 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_chamelium_audio@hdmi-audi=
o.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-64x64.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_cursor=
_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-panning-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@kms_flip@fl=
ip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_flip@fl=
ip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@kms_fli=
p@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_hdr@=
bpc-switch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4838">Intel=
 XE#4838</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_hd=
r@static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_hdr@static-swap.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426"=
>Intel XE#4426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_hdr@static-swap@pipe-a-=
dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4426">Intel XE#4426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/igt@kms_pipe_crc_basic@nonblockin=
g-crc-frame-sequence@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr@fbc-psr2-basic@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_psr@psr-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_compute_preempt@compute-p=
reempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_eudebug@attach-debug-met=
adata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_eudebug_online@resume-dss.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-ex=
ec-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-busy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_exec_system_allocator@man=
y-execqueues-malloc-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +17 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e680=
48316a/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e92=
56e68048316a/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be21=
9992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48=
d3be219992e9256e68048316a/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e2=
43be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c=
1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-30=
17-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048=
316a/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256=
e68048316a/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be21999=
2e9256e68048316a/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3b=
e219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243b=
e48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c131=
2e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-=
f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48520v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148520v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148520v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148520v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_oa@buffer-fill.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-8/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148520v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_pm_residency@cpg-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe=
-c-edp-1}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148520v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_atom=
ic_transition@modeset-transition-fencing.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-=
bmg-7/igt@kms_atomic_transition@modeset-transition-fencing.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148520v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4928">Intel XE#4928</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-b=
mg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_curs=
or_legacy@single-move.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_cursor_legacy=
@single-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg=
-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard=
-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
2/igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3.html">PASS</a> +11 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/sha=
rd-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@kms_pla=
ne@plane-panning-top-left@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-ad=
lp-2/igt@kms_plane@plane-panning-top-left@pipe-a.html">PASS</a> +12 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">=
Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148520v1/shard-adlp-8/igt@kms_plane_scaling@planes-u=
pscale-factor-0-25-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_vbla=
nk@query-busy-hang@pipe-d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4892">Intel XE#4892</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/ig=
t@kms_vblank@query-busy-hang@pipe-d-dp-2.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148520v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +7 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-free.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428=
">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared=
-vm-many-execqueues-mmap-free.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
520v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-strid=
e-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-6/igt@xe_oa@oa=
-exponents@ccs-0.html">TIMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-433/igt@xe_pm@s2idl=
e-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-adlp-3/igt@xe_pm@s4-d=
3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-lnl-2/igt@xe_pmu@g=
t-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4817">Intel XE#4817</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-lnl-5/igt@xe_pmu@gt-frequency=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48520v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148520v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-adlp-6/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4=
911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48520v1/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send=
_recv.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048=
316a/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e6=
8048316a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e92=
56e68048316a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be21999=
2e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be2=
19992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e24=
3be48d3be219992e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c131=
2e243be48d3be219992e9256e68048316a/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6=
c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-301=
7-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e68048316=
a/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e6804=
8316a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9256e=
68048316a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3017-f6c1312e243be48d3be219992e9=
256e68048316a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428"=
>Intel XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
20v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148520v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE=
#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3017-f6c1312e243be48d3be219992e9256e68048316a/shard-dg2-433/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148520v1/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3017-f6c1312e243be48d3be219992e9256e68048316a -&gt; xe-pw-148=
520v1</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3017-f6c1312e243be48d3be219992e9256e68048316a: f6c1312e243be48d3be2199=
92e9256e68048316a<br />
  xe-pw-148520v1: 148520v1</p>

</body>
</html>

--===============9073936169172799722==--
