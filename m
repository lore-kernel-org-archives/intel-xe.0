Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06361C7115A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Jun 2025 21:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7EE10E250;
	Sun, 15 Jun 2025 21:23:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FB010E244;
 Sun, 15 Jun 2025 21:23:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1160684247642097185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Tweak_default_Gu?=
 =?utf-8?q?C_log_level_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 15 Jun 2025 21:23:42 -0000
Message-ID: <175002262230.80539.8049479995952598331@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
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

--===============1160684247642097185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Tweak default GuC log level (rev2)
URL   : https://patchwork.freedesktop.org/series/150183/
State : failure

== Summary ==

CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_FULL -> xe-pw-150183v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150183v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150183v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150183v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck.html

  
Known issues
------------

  Here are the changes found in xe-pw-150183v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#664])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3908])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#3908])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#787]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#4417]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2325])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#5176])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2321])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1424])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2321])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2286])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4302])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4354])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4156])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#301]) +6 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2316]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2316])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#886]) +4 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#455]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4141]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2312]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#653]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2927])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4329])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4596])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#736])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#3309])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1439] / [Intel XE#3141])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2893] / [Intel XE#4608])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4608]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1489])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#4609]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#3414] / [Intel XE#3904])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1435])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4837])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4837]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@single-step:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4837])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#688])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1392])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#288]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4915]) +35 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4943])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4943]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#4937])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2229])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#5100])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2284] / [Intel XE#366])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][98] -> [ABORT][99] ([Intel XE#1794])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pmu@gt-frequency:
    - shard-adlp:         NOTRUN -> [ABORT][100] ([Intel XE#5214]) +2 other tests abort
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-4/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4733]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#3342])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [SKIP][103] ([Intel XE#4963]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-adlp:         [SKIP][105] ([Intel XE#4950]) -> [PASS][106] +18 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-63.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][107] ([Intel XE#4543]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][111] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][113] ([Intel XE#2291]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +2 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [SKIP][119] ([Intel XE#4947]) -> [PASS][120] +2 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [INCOMPLETE][121] ([Intel XE#4842]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute}:
    - shard-bmg:          [ABORT][123] ([Intel XE#3970]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - shard-bmg:          [FAIL][125] -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][127] ([Intel XE#5018]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s2idle-basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-3/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [INCOMPLETE][133] ([Intel XE#569]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#4835]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@xe_pmu@gt-frequency.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [SKIP][137] ([Intel XE#4945]) -> [PASS][138] +29 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_vm@large-misaligned-binds-2147483648.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-adlp:         [SKIP][139] ([Intel XE#4947]) -> [SKIP][140] ([Intel XE#1124])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][141] ([Intel XE#4947]) -> [SKIP][142] ([Intel XE#316]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         [SKIP][143] ([Intel XE#4947]) -> [SKIP][144] ([Intel XE#610])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][145] ([Intel XE#4950]) -> [SKIP][146] ([Intel XE#367])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][147] ([Intel XE#4947]) -> [SKIP][148] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][149] ([Intel XE#4947]) -> [SKIP][150] ([Intel XE#2907]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][151] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         [SKIP][153] ([Intel XE#4947]) -> [SKIP][154] ([Intel XE#4417] / [Intel XE#455])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cdclk@mode-transition.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][155] ([Intel XE#4950]) -> [SKIP][156] ([Intel XE#373])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][157] ([Intel XE#1178]) -> [SKIP][158] ([Intel XE#2341])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][159] ([Intel XE#1188]) -> [SKIP][160] ([Intel XE#2341])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_content_protection@uevent.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         [SKIP][161] ([Intel XE#4947]) -> [SKIP][162] ([Intel XE#776])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fbcon_fbt@psr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][163] ([Intel XE#2882]) -> [SKIP][164] ([Intel XE#2316])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         [SKIP][165] ([Intel XE#4950]) -> [SKIP][166] ([Intel XE#310]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         [SKIP][167] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][168] ([Intel XE#455])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-adlp:         [SKIP][169] ([Intel XE#4947]) -> [SKIP][170] ([Intel XE#455]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][171] ([Intel XE#4947]) -> [SKIP][172] ([Intel XE#651]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2311]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][175] ([Intel XE#4947]) -> [SKIP][176] ([Intel XE#656]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#2312]) -> [SKIP][178] ([Intel XE#4141])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][179] ([Intel XE#4141]) -> [SKIP][180] ([Intel XE#2312]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][181] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][182] ([Intel XE#651])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#2312]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][185] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][186] ([Intel XE#656]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2313]) -> [SKIP][188] ([Intel XE#2312]) +9 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][189] ([Intel XE#4947]) -> [SKIP][190] ([Intel XE#653]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#2313]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [SKIP][193] ([Intel XE#4950]) -> [SKIP][194] ([Intel XE#455]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         [SKIP][195] ([Intel XE#4947]) -> [SKIP][196] ([Intel XE#1489])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][197] ([Intel XE#4947]) -> [SKIP][198] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][199] ([Intel XE#4950]) -> [SKIP][200] ([Intel XE#1127])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         [SKIP][201] ([Intel XE#4945]) -> [SKIP][202] ([Intel XE#455] / [Intel XE#488])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_ccs@suspend-resume.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         [SKIP][203] ([Intel XE#4945]) -> [SKIP][204] ([Intel XE#4837]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_eudebug@read-metadata.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         [SKIP][205] ([Intel XE#4945]) -> [SKIP][206] ([Intel XE#261] / [Intel XE#688])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_evict@evict-large-cm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][207] ([Intel XE#4945]) -> [SKIP][208] ([Intel XE#288]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         [SKIP][209] ([Intel XE#4945]) -> [SKIP][210] ([Intel XE#4915]) +60 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         [SKIP][211] ([Intel XE#4945]) -> [SKIP][212] ([Intel XE#2541] / [Intel XE#3573])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@non-privileged-map-oa-buffer.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-adlp:         [SKIP][213] ([Intel XE#4945]) -> [SKIP][214] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@syncs-ufence-wait-cfg.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         [SKIP][215] ([Intel XE#4945]) -> [SKIP][216] ([Intel XE#2284] / [Intel XE#366])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-adlp:         [FAIL][217] ([Intel XE#5219]) -> [ABORT][218] ([Intel XE#5214])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_pmu@all-fn-engine-activity-load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-6/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@engine-activity-all-load:
    - shard-adlp:         [ABORT][219] ([Intel XE#5214]) -> [DMESG-WARN][220] ([Intel XE#5214])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pmu@engine-activity-all-load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-8/igt@xe_pmu@engine-activity-all-load.html

  * igt@xe_pmu@engine-activity-all-load-idle:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#5214]) -> [ABORT][222] ([Intel XE#5214]) +4 other tests abort
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_pmu@engine-activity-all-load-idle.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-8/igt@xe_pmu@engine-activity-all-load-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         [SKIP][223] ([Intel XE#4945]) -> [SKIP][224] ([Intel XE#4733])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         [SKIP][225] ([Intel XE#4945]) -> [SKIP][226] ([Intel XE#944])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_query@multigpu-query-gt-list.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-adlp:         [SKIP][227] ([Intel XE#4945]) -> [SKIP][228] ([Intel XE#4821])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_spin_batch@spin-mem-copy.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_spin_batch@spin-mem-copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
  [Intel XE#5219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5219
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-pw-150183v2

  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895331224e057508c07a
  xe-pw-150183v2: 150183v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/index.html

--===============1160684247642097185==
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
<tr><td><b>Series:</b></td><td>drm/xe: Tweak default GuC log level (rev2)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150183/">https://patchwork.freedesktop.org/series/150183/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150183v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150183v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057=
508c07a_FULL -&gt; xe-pw-150183v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150183v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150183v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1501=
83v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-stride-mmap-mlock-nomemset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shar=
d-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-mlock-nomemse=
t.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-mmap-shared-remap-eocheck.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150183v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_async_flips@test-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-=
4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">=
Intel XE#3908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp=
-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-t=
iled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-=
enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5176">Intel XE#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-lnl-3/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/s=
hard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers=
@pipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_eudebug@basic-vm-access-us=
erptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_eudebug@basic-vm-bind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_eudebug_online@single-st=
ep.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_exec_fault_mode@many-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#494=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
183v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-strid=
e-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evi=
ct_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-lnl-2/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-150183v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-adlp-4/igt@xe_pmu@gt-frequency.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/521=
4">Intel XE#5214</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@core_ho=
tunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@co=
re_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_add=
fb_basic@bad-pitch-63.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_addf=
b_basic@bad-pitch-63.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150183v2/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b=
-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random=
-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0183v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-=
hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150183v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg=
-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
183v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@k=
ms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel X=
E#4842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150183v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_en=
gine_class_compute}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_compu=
te_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compu=
te.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3970">Intel XE#3970</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150183v2/shard-bmg-4/igt@xe_compute_preempt@compute-=
preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemse=
t:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2=
/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unm=
ap-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150183v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_exe=
c_threads@threads-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2=
-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s=
2idle-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-3/i=
gt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3=
-vm-bind-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@xe_pm@s3-v=
m-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4835">Intel XE#4835</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-dg2-464/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_vm@l=
arge-misaligned-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/i=
gt@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +29 other tests p=
ass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@k=
ms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms=
_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/i=
gt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_bw@=
linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-=
2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs=
@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-=
adlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-=
adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel =
XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150183v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cdc=
lk@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_cdclk@m=
ode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cha=
melium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/i=
gt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fbc=
on_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-bmg-6/igt@kms_flip=
@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@=
kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150183v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150183v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50183v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1501=
83v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
7">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-s=
cndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50183v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
183v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150183v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_pla=
ne_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@=
kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr=
2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/=
shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr=
@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@kms_=
psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_rot=
ation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-a=
dlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE=
#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_ccs@=
suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_ccs@suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_eude=
bug@read-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_eudebug@r=
ead-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_evic=
t@evict-large-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_evict@evic=
t-large-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adl=
p-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec=
_system_allocator@processes-evict-malloc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-=
adlp-2/igt@xe_exec_system_allocator@processes-evict-malloc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel =
XE#4915</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@n=
on-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe=
_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@s=
yncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_oa@syn=
cs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pm@d=
3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_pm@d3cold-m=
map-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_pmu@=
all-fn-engine-activity-load.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5219">Intel XE#5219</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-6/igt@xe=
_pmu@all-fn-engine-activity-load.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-all-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pmu@=
engine-activity-all-load.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-8/igt@xe_p=
mu@engine-activity-all-load.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-all-load-idle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_pmu@=
engine-activity-all-load-idle.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-=
8/igt@xe_pmu@engine-activity-all-load-idle.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) +4=
 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pxp@=
display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_pxp@display-=
pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_quer=
y@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_qu=
ery@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150183v2/shard-adlp-2/igt@xe_spin_b=
atch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -&gt; xe-pw-150=
183v2</li>
</ul>
<p>IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895=
331224e057508c07a<br />
  xe-pw-150183v2: 150183v2</p>

</body>
</html>

--===============1160684247642097185==--
