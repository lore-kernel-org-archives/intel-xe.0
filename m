Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F45C87FD3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 23:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCB510E2DB;
	Thu, 31 Jul 2025 23:34:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137CB10E2CE;
 Thu, 31 Jul 2025 23:34:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2098808709829044554=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/display=3A_Make_pan?=
 =?utf-8?q?ic_support_work_on_vram=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 23:34:26 -0000
Message-ID: <175400486601.203649.17161786042805451924@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731152700.2196681-1-dev@lankhorst.se>
In-Reply-To: <20250731152700.2196681-1-dev@lankhorst.se>
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

--===============2098808709829044554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Make panic support work on vram. (rev2)
URL   : https://patchwork.freedesktop.org/series/150887/
State : failure

== Summary ==

CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -> xe-pw-150887v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150887v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150887v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150887v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  
Known issues
------------

  Here are the changes found in xe-pw-150887v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#4963])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][7] ([Intel XE#911]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4947]) +22 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#607])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2907])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +125 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#3124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#306])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2325])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#308])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4950]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2291]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4302])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4422])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#4543]) +3 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#301])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][57] ([Intel XE#4683]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2293]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1397] / [Intel XE#1745])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1397])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#4947]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#5390]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#651]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#651]) +12 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#653]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4298])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#455]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2486])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#616]) +3 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#4596])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#4950]) +55 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2763]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#4962])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1489]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2893])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1489]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#1435]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#4459]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#1499])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@discovery-race:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4837])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_eudebug@discovery-race.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#4837]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4837]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2322]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1392])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#1392]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#288]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][100] -> [DMESG-WARN][101] ([Intel XE#3876])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4943]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4943]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#5018]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#4945]) +266 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +98 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#2229]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#560])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#3573]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2284] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4733])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4733])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4945]) +33 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4130])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [PASS][118] -> [FAIL][119] ([Intel XE#5717])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@xe_vm@bind-array-enobufs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-435/igt@xe_vm@bind-array-enobufs.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][120] ([Intel XE#4963]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][122] ([Intel XE#4672]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][124] ([Intel XE#2134]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][126] ([Intel XE#4947]) -> [PASS][127] +12 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#3862]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][132] ([Intel XE#4633]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [SKIP][134] ([Intel XE#4950]) -> [PASS][135] +56 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][136] ([Intel XE#2316]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][138] ([Intel XE#4543]) -> [PASS][139] +3 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][140] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][143] +8 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#4208]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][148] ([Intel XE#4962]) -> [PASS][149] +2 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [FAIL][150] ([Intel XE#5420]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1392]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [SKIP][154] ([Intel XE#4945]) -> [PASS][155] +309 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][156] ([Intel XE#5018]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][158] ([Intel XE#5166]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][160] ([Intel XE#5177]) -> [FAIL][161] ([Intel XE#4665])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][162] ([Intel XE#2327]) -> [SKIP][163] ([Intel XE#4947]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][164] ([Intel XE#4947]) -> [SKIP][165] ([Intel XE#2327]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][166] ([Intel XE#2328]) -> [SKIP][167] ([Intel XE#4947])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][168] ([Intel XE#1124]) -> [SKIP][169] ([Intel XE#4947]) +6 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][170] ([Intel XE#610]) -> [SKIP][171] ([Intel XE#4947])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][172] ([Intel XE#4947]) -> [SKIP][173] ([Intel XE#1124]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][174] ([Intel XE#4950]) -> [SKIP][175] ([Intel XE#2314] / [Intel XE#2894])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][176] ([Intel XE#4950]) -> [SKIP][177] ([Intel XE#367]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][178] ([Intel XE#367]) -> [SKIP][179] ([Intel XE#4950]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][180] ([Intel XE#4947]) -> [SKIP][181] ([Intel XE#2652] / [Intel XE#787])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][182] ([Intel XE#4947]) -> [SKIP][183] ([Intel XE#3432]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          [SKIP][184] ([Intel XE#2887]) -> [SKIP][185] ([Intel XE#4947]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][186] ([Intel XE#4947]) -> [SKIP][187] ([Intel XE#2887]) +11 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][188] ([Intel XE#2724]) -> [SKIP][189] ([Intel XE#4947])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][190] ([Intel XE#4950]) -> [SKIP][191] ([Intel XE#2325])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          [SKIP][192] ([Intel XE#2252]) -> [SKIP][193] ([Intel XE#4950]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          [SKIP][194] ([Intel XE#4950]) -> [SKIP][195] ([Intel XE#2252]) +7 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][196] ([Intel XE#1178]) -> [SKIP][197] ([Intel XE#4950])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][198] ([Intel XE#4950]) -> [SKIP][199] ([Intel XE#2390]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][200] ([Intel XE#4950]) -> [SKIP][201] ([Intel XE#2341])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][202] ([Intel XE#1188]) -> [SKIP][203] ([Intel XE#4950])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_content_protection@uevent.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][204] ([Intel XE#4950]) -> [SKIP][205] ([Intel XE#2321])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][206] ([Intel XE#4950]) -> [SKIP][207] ([Intel XE#2320])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][208] ([Intel XE#2320]) -> [SKIP][209] ([Intel XE#4950]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][210] ([Intel XE#2321]) -> [SKIP][211] ([Intel XE#4950]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][212] ([Intel XE#2291]) -> [SKIP][213] ([Intel XE#4950]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][214] ([Intel XE#2286]) -> [SKIP][215] ([Intel XE#4950])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][216] ([Intel XE#4947]) -> [SKIP][217] ([Intel XE#1508])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][218] ([Intel XE#4947]) -> [SKIP][219] ([Intel XE#4354])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][220] ([Intel XE#2244]) -> [SKIP][221] ([Intel XE#4947]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][222] ([Intel XE#4422]) -> [SKIP][223] ([Intel XE#4945])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][224] ([Intel XE#5425]) -> [SKIP][225] ([Intel XE#4947])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][226] ([Intel XE#1138]) -> [SKIP][227] ([Intel XE#4950])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][228] ([Intel XE#4950]) -> [SKIP][229] ([Intel XE#2374])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][230] ([Intel XE#2316]) -> [SKIP][231] ([Intel XE#4950]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][232] ([Intel XE#301]) -> [FAIL][233] ([Intel XE#301] / [Intel XE#3149])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][234] ([Intel XE#4947]) -> [SKIP][235] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][236] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][237] ([Intel XE#4947]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [SKIP][239] ([Intel XE#2311]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#2312]) +10 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#2311]) -> [SKIP][243] ([Intel XE#4947]) +13 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][244] ([Intel XE#4947]) -> [SKIP][245] ([Intel XE#2311]) +22 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][246] ([Intel XE#5390]) -> [SKIP][247] ([Intel XE#4947]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][248] ([Intel XE#2312]) -> [SKIP][249] ([Intel XE#5390]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#5390]) +10 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][252] ([Intel XE#5390]) -> [SKIP][253] ([Intel XE#2312]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][254] ([Intel XE#2352]) -> [SKIP][255] ([Intel XE#4947])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][256] ([Intel XE#4947]) -> [SKIP][257] ([Intel XE#2313]) +24 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][258] ([Intel XE#2312]) -> [SKIP][259] ([Intel XE#4947]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          [SKIP][260] ([Intel XE#2313]) -> [SKIP][261] ([Intel XE#4947]) +13 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][262] ([Intel XE#5672]) -> [SKIP][263] ([Intel XE#4947])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][264] ([Intel XE#2312]) -> [SKIP][265] ([Intel XE#2313]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][266] ([Intel XE#2313]) -> [SKIP][267] ([Intel XE#2312]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][268] ([Intel XE#2934]) -> [SKIP][269] ([Intel XE#4947])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][270] ([Intel XE#4947]) -> [SKIP][271] ([Intel XE#4090])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][272] ([Intel XE#4947]) -> [SKIP][273] ([Intel XE#4329])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][274] ([Intel XE#2393]) -> [SKIP][275] ([Intel XE#4950])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][276] ([Intel XE#5021]) -> [SKIP][277] ([Intel XE#4596])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][278] ([Intel XE#4950]) -> [SKIP][279] ([Intel XE#5020])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][280] ([Intel XE#4947]) -> [SKIP][281] ([Intel XE#870])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][282] ([Intel XE#870]) -> [SKIP][283] ([Intel XE#4947])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][284] ([Intel XE#4947]) -> [SKIP][285] ([Intel XE#2391])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][286] ([Intel XE#2392]) -> [SKIP][287] ([Intel XE#4947])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][288] ([Intel XE#4947]) -> [SKIP][289] ([Intel XE#2392])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][290] ([Intel XE#1489]) -> [SKIP][291] ([Intel XE#4947]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][292] ([Intel XE#4947]) -> [SKIP][293] ([Intel XE#1489]) +5 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][294] ([Intel XE#2387]) -> [SKIP][295] ([Intel XE#4947])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][296] ([Intel XE#4947]) -> [SKIP][297] ([Intel XE#2387]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][298] ([Intel XE#4947]) -> [SKIP][299] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][300] ([Intel XE#4947]) -> [SKIP][301] ([Intel XE#2234])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][302] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][303] ([Intel XE#4947]) +8 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_psr@psr2-suspend.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][304] ([Intel XE#2414]) -> [SKIP][305] ([Intel XE#4947])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][306] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][307] ([Intel XE#4950])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][308] ([Intel XE#4950]) -> [SKIP][309] ([Intel XE#3414] / [Intel XE#3904])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][310] ([Intel XE#4950]) -> [SKIP][311] ([Intel XE#2330])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][312] ([Intel XE#4950]) -> [SKIP][313] ([Intel XE#2413])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][314] ([Intel XE#2426]) -> [SKIP][315] ([Intel XE#4950])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][316] ([Intel XE#2450]) -> [SKIP][317] ([Intel XE#4950])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][318] ([Intel XE#1499]) -> [SKIP][319] ([Intel XE#4950])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@flip-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][320] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][321] ([Intel XE#4950])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][322] ([Intel XE#4945]) -> [SKIP][323] ([Intel XE#4837]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][324] ([Intel XE#4837]) -> [SKIP][325] ([Intel XE#4945]) +10 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][326] ([Intel XE#4945]) -> [SKIP][327] ([Intel XE#4518])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][328] ([Intel XE#4518]) -> [SKIP][329] ([Intel XE#4945])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][330] ([Intel XE#4945]) -> [SKIP][331] ([Intel XE#2322]) +6 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][332] ([Intel XE#2322]) -> [SKIP][333] ([Intel XE#4945]) +5 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][334] ([Intel XE#4943]) -> [SKIP][335] ([Intel XE#4945]) +18 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][336] ([Intel XE#4945]) -> [SKIP][337] ([Intel XE#4943]) +12 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][338] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [SKIP][339] ([Intel XE#4945])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][340] ([Intel XE#4945]) -> [ABORT][341] ([Intel XE#5530])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][342] ([Intel XE#586]) -> [SKIP][343] ([Intel XE#4945])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_mmap@small-bar.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][344] ([Intel XE#2245]) -> [SKIP][345] ([Intel XE#4945])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][346] ([Intel XE#4945]) -> [SKIP][347] ([Intel XE#5694])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][348] ([Intel XE#2284]) -> [SKIP][349] ([Intel XE#4945])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][350] ([Intel XE#4945]) -> [SKIP][351] ([Intel XE#2284]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][352] ([Intel XE#4733]) -> [SKIP][353] ([Intel XE#4945])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pxp@pxp-optout.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][354] ([Intel XE#4945]) -> [SKIP][355] ([Intel XE#4733])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][356] ([Intel XE#4945]) -> [SKIP][357] ([Intel XE#944]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-config.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][358] ([Intel XE#944]) -> [SKIP][359] ([Intel XE#4945]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][360] ([Intel XE#4945]) -> [SKIP][361] ([Intel XE#4130])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][362] ([Intel XE#4273]) -> [SKIP][363] ([Intel XE#4945])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][364] ([Intel XE#4945]) -> [SKIP][365] ([Intel XE#4351])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5717
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -> xe-pw-150887v2

  IGT_8482: 8482
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a
  xe-pw-150887v2: 150887v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/index.html

--===============2098808709829044554==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Make panic support work on vram. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150887/">https://patchwork.freedesktop.org/series/150887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -&gt; xe-pw-150887v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150887v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150887v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150887v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150887v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-64x21.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +266 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-435/igt@xe_vm@bind-array-enobufs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5717">Intel XE#5717</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +8 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eu_stall@blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">PASS</a> +309 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-dg2-463/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150887v2/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -&gt; xe-pw-150887v2</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a<br />
  xe-pw-150887v2: 150887v2</p>

</body>
</html>

--===============2098808709829044554==--
