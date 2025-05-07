Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50BFC369DC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 06:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066F10E079;
	Wed,  7 May 2025 06:00:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2C110E079;
 Wed,  7 May 2025 06:00:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8530944934472691573=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHNlcmllcyBzdGFydGluZyB3aXRo?=
 =?utf-8?b?IFsxLzFdIGRybS94ZTogVXNlIGNvcHlfZnJvbV91c2VyKCkgaW5zdGVhZCBvZiBf?=
 =?utf-8?b?X2NvcHlfZnJvbV91c2VyKCkgKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 06:00:03 -0000
Message-ID: <174659760344.54074.420480105134260750@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <acabf20aa8621c7bc8de09b1bffb8d14b5376484.1746126614.git.harish.chegondi@intel.com>
In-Reply-To: <acabf20aa8621c7bc8de09b1bffb8d14b5376484.1746126614.git.harish.chegondi@intel.com>
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

--===============8530944934472691573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe: Use copy_from_user() instead of __copy_from_user() (rev2)
URL   : https://patchwork.freedesktop.org/series/148526/
State : failure

== Summary ==

CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL -> xe-pw-148526v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148526v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148526v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148526v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@flip-vs-dpms-on-nop@d-dp2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop@d-dp2.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plane_lowres@tiling-4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_plane_lowres@tiling-4.html

  * igt@xe_exec_capture@reset:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@xe_exec_capture@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_capture@reset.html

  
Known issues
------------

  Here are the changes found in xe-pw-148526v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#827])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#911]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#787]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2907])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#3442])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +146 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1727] / [Intel XE#3113])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#306])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#373]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#4883])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_color@deep-color.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178]) +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#307])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#309]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4494])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#3009])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_aux_dev.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#4356])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4294])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#776])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#310]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#301])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#886]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@flip-vs-dpms-on-nop.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#301]) +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#301])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#4543])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1874]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#651]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@basic-force-big-joiner@single:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][77] ([Intel XE#3428])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner@single.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#4173]) +5 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#616])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][81] ([Intel XE#3428])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-b-dp-2.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#870])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1129])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1489])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1489]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2850] / [Intel XE#929])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#3414]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#330])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#4358]) +1 other test incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_ccs@suspend-resume.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1123])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1126])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#4837]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4837])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4837])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#688])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#261] / [Intel XE#688])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#688]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#1392]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1392]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4943]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-malloc-busy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4915]) +10 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_system_allocator@many-large-malloc-busy.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4915]) +42 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-lnl:          NOTRUN -> [ABORT][108] ([Intel XE#4757])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2229])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#3428]) +13 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@many-reload.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4501])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_oa@buffer-size.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#979])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][118] ([Intel XE#1173])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#366])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][120] -> [ABORT][121] ([Intel XE#1794])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][122] -> [ABORT][123] ([Intel XE#1794])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4733])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4814])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html

  
#### Possible fixes ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-adlp:         [SKIP][126] ([Intel XE#4618]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][128] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][130] ([Intel XE#2291]) -> [PASS][131] +7 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#4173]) -> [PASS][133] +5 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][134] ([Intel XE#4354]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][136] ([Intel XE#2373]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][138] ([Intel XE#3321]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#301]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][142] ([Intel XE#2316]) -> [PASS][143] +10 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][144] ([Intel XE#301]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#4543]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][148] ([Intel XE#1503]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][150] ([Intel XE#3012]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][152] ([Intel XE#4596]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_rpm@legacy-planes.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:
    - shard-adlp:         [SKIP][156] ([Intel XE#4945]) -> [PASS][157] +5 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][158] -> [PASS][159] +23 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1392]) -> [PASS][161] +5 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#4423]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][164] ([Intel XE#1794]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][166] ([Intel XE#1794]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [SKIP][168] -> [FAIL][169] ([Intel XE#827])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][170] -> [SKIP][171] ([Intel XE#316])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-adlp:         [SKIP][172] -> [SKIP][173] ([Intel XE#1124])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][174] ([Intel XE#4950]) -> [SKIP][175] ([Intel XE#2191])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][176] -> [SKIP][177] ([Intel XE#2907]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-adlp:         [SKIP][178] -> [SKIP][179] ([Intel XE#306])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_color@ctm-limited-range.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-adlp:         [SKIP][180] ([Intel XE#4950]) -> [SKIP][181] ([Intel XE#373])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         [SKIP][182] -> [SKIP][183] ([Intel XE#373])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         [SKIP][184] -> [SKIP][185] ([Intel XE#307])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][186] ([Intel XE#2341]) -> [FAIL][187] ([Intel XE#1178]) +2 other tests fail
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_content_protection@legacy.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][188] ([Intel XE#1178]) -> [SKIP][189] ([Intel XE#2341])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_content_protection@srm.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][190] ([Intel XE#3321]) -> [SKIP][191] ([Intel XE#2316])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-adlp:         [SKIP][192] -> [SKIP][193] ([Intel XE#455])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][194] ([Intel XE#2311]) -> [SKIP][195] ([Intel XE#2312]) +21 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][196] ([Intel XE#2312]) -> [SKIP][197] ([Intel XE#4141]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#4141]) -> [SKIP][199] ([Intel XE#2312]) +11 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][200] -> [SKIP][201] ([Intel XE#651])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2311]) +24 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][204] ([Intel XE#2313]) -> [SKIP][205] ([Intel XE#2312]) +17 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][206] ([Intel XE#2351]) -> [SKIP][207] ([Intel XE#656])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][208] ([Intel XE#2312]) -> [SKIP][209] ([Intel XE#2313]) +23 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][210] -> [SKIP][211] ([Intel XE#656]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         [SKIP][212] -> [SKIP][213] ([Intel XE#653]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][214] ([Intel XE#3012]) -> [DMESG-WARN][215] ([Intel XE#3428])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][216] ([Intel XE#2493]) -> [SKIP][217] ([Intel XE#4596])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         [SKIP][218] -> [SKIP][219] ([Intel XE#870])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         [SKIP][220] ([Intel XE#2351]) -> [SKIP][221] ([Intel XE#1129])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][222] -> [SKIP][223] ([Intel XE#1489]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         [SKIP][224] -> [SKIP][225] ([Intel XE#2850] / [Intel XE#929])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         [SKIP][226] ([Intel XE#4947]) -> [SKIP][227] ([Intel XE#2850] / [Intel XE#929])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1500]) -> [SKIP][229] ([Intel XE#362])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         [SKIP][230] -> [SKIP][231] ([Intel XE#1126])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-adlp:         [SKIP][232] ([Intel XE#4945]) -> [SKIP][233] ([Intel XE#4837])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eudebug_online@tdctl-parameters.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         [SKIP][234] -> [SKIP][235] ([Intel XE#688])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][236] -> [SKIP][237] ([Intel XE#1392])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][238] ([Intel XE#4945]) -> [SKIP][239] ([Intel XE#1392])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         [SKIP][240] -> [SKIP][241] ([Intel XE#288]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - shard-adlp:         [SKIP][242] -> [SKIP][243] ([Intel XE#4915]) +17 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [SKIP][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269]) ([Intel XE#2457]) -> ([PASS][270], [PASS][271], [PASS][272], [PASS][273], [SKIP][274], [PASS][275], [PASS][276], [DMESG-WARN][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [DMESG-WARN][286], [DMESG-WARN][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [DMESG-WARN][292], [DMESG-WARN][293], [PASS][294], [PASS][295]) ([Intel XE#2457] / [Intel XE#3428])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         [SKIP][296] -> [SKIP][297] ([Intel XE#4501])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@buffer-size.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_oa@buffer-size.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         [SKIP][298] ([Intel XE#4945]) -> [SKIP][299] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1061]) -> [FAIL][301] ([Intel XE#1173])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_peer2peer@read.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][302] -> [SKIP][303] ([Intel XE#1948])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         [SKIP][304] -> [SKIP][305] ([Intel XE#4814])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_render_copy@render-stress-1-copies.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_render_copy@render-stress-1-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4358
  [Intel XE#4423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4423
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
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
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -> xe-pw-148526v2

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
  xe-pw-148526v2: 148526v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/index.html

--===============8530944934472691573==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe: Use copy_=
from_user() instead of __copy_from_user() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148526/">https://patchwork.freedesktop.org/series/148526/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148526v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148526v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6=
aed9ae9_FULL -&gt; xe-pw-148526v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148526v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148526v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1485=
26v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_curs=
or_edge_walk@256x256-top-bottom.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_cursor_ed=
ge_walk@256x256-top-bottom.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip=
@flip-vs-dpms-on-nop@d-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_flip@flip-vs-d=
pms-on-nop@d-dp2.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plan=
e_lowres@tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_plane_lowres@tiling-4.h=
tml">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_capture@reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@xe_exe=
c_capture@reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_capture@reset.html"=
>FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148526v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_async_flips@alternate-sy=
nc-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/=
shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pip=
e-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-ti=
led-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_chamelium_hpd@common-hp=
d-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_colo=
r@deep-color.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883">I=
ntel XE#4883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-on-=
nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip=
@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on=
-nop.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-6/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-7/igt@kms_=
flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner@single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_joiner@basic-force-big-jo=
iner@single.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pip=
e-b-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@kms_psr@psr2-no-drrs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_ccs@s=
uspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_ccs@suspend-resume.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4358">Intel XE#4358</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_eudebug_online@interrupt-=
other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_eudebug_online@tdctl-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_evict@evict-beng-large-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_evict@evict-large-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_exec_system_allocator@ma=
ny-large-malloc-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-free-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@many-reload=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3428">Intel XE#3428</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_oa@buffer-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501"=
>Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_oa@non-privileged-map-oa-=
buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-7/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148526v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-8/igt@xe_pxp@display-black-pxp-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_s=
ysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-=
adlp-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148526v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148526v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_cur=
sor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148526v2/shard-adlp-9/igt@kms_cursor_legacy@short-flip-aft=
er-cursor-atomic-transitions-varying-size.html">PASS</a> +5 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148526v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
d-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148526v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148526v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adl=
p-8/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_=
fdinfo@parallel-utilization-single-full-load-isolation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48526v2/shard-adlp-3/igt@xe_drm_fdinfo@parallel-utilization-single-full-loa=
d-isolation.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@many-execqueues-bindexecqueue-userptr-rebind.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adl=
p-3/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">PA=
SS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433=
/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> +5 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@=
s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4423">Intel XE#4423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-435/igt=
@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-2/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-lnl-3/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-2/igt@xe_pm@s4-v=
m-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@km=
s_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big=
_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_big_fb@y-ti=
led-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big=
_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_big_fb@yf-=
tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@=
connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/s=
hard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms=
_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_color@ctm-limited-range.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_chamelium=
_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-=
3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_cha=
melium_hpd@vga-hpd-after-hibernate.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_chame=
lium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_con=
tent_protection@dp-mst-lic-type-1.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_conten=
t_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2=
/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-=
downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148526v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148526v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
26v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/s=
hard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148526v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
526v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148526v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
26v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-=
adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_fr=
ontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@kms_j=
oiner@basic-force-big-joiner.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_pm_backlight@fa=
de-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_=
dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_pm_dc@dc6-psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3=
/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
@fbc-psr2-basic.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_psr@fbc-psr2-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr=
@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@kms_psr@psr2-no-=
drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy=
_basic@mem-set-linear-0xfd.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_copy_basic@mem=
-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eude=
bug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe=
_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evic=
t_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/i=
gt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#6=
88</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48526v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/s=
hard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe=
_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-malloc-busy.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/sh=
ard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc=
-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4915">Intel XE#4915</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed=
9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed=
6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df=
35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72=
b9df35ed6aed9ae9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b9=
6d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040=
f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c10=
6040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c27=
6c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c=
3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-=
842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae=
9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48526v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48526v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148526v2/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14852=
6v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148526v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Int=
el XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@b=
uffer-size.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_oa@buffer-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel=
 XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@s=
yncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_oa@sy=
ncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_rend=
er_copy@render-stress-1-copies.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148526v2/shard-adlp-3/igt@xe_render_cop=
y@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -&gt; xe-pw-148=
526v2</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d7=
2b9df35ed6aed9ae9<br />
  xe-pw-148526v2: 148526v2</p>

</body>
</html>

--===============8530944934472691573==--
