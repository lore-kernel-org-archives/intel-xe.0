Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE697CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 12:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76B10E1C9;
	Thu, 28 Aug 2025 12:46:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BDC10E0CB;
 Thu, 28 Aug 2025 12:46:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5351377592085715958=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Smatch_static_checker_warn?=
 =?utf-8?q?ing_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 12:46:10 -0000
Message-ID: <175638517022.279076.15230199108138849594@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
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

--===============5351377592085715958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Smatch static checker warning fixes
URL   : https://patchwork.freedesktop.org/series/153617/
State : success

== Summary ==

CI Bug Log - changes from xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d_FULL -> xe-pw-153617v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153617v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] ([Intel XE#4208]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@core_getversion@all-cards.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#664])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#2613]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#2351] / [Intel XE#4208]) +15 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2907]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +16 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#787]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +118 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113]) +1 other test incomplete
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#373]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#307])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2341])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1188])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#308])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#308])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#309])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#5354])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#1475])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4494] / [i915#3804])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#4422])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#3098])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#4543]) +10 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#2049] / [Intel XE#2597])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][57] -> [DMESG-FAIL][58] ([Intel XE#4543]) +2 other tests dmesg-fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#656]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5390]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#651]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#653]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#346])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#616]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#4596])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#5020])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#718])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#1489])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#1489])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#4208] / [i915#2575]) +93 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1499])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1091] / [Intel XE#2849])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#5794])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#5890])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1123])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#5626])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4837]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#4837]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#5563] / [Intel XE#688])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2322]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#288] / [Intel XE#5561]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#288]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@many-stride-malloc-busy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4915]) +33 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_exec_system_allocator@many-stride-malloc-busy.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4943]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-free-huge.html

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#4915]) +32 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-new-race.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#3573]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_pm@d3hot-i2c:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#5742])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1948])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4733])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3342])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#4208]) +233 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][105] ([Intel XE#4208]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@core_getversion@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@core_getversion@basic.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#2134]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@fbdev@nullptr.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@fbdev@nullptr.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#4208] / [i915#2575]) -> [PASS][110] +81 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][111] ([Intel XE#3908]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][113] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][116] +13 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][117] ([Intel XE#2291]) -> [PASS][118] +2 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [DMESG-WARN][119] ([Intel XE#5354]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][121] ([Intel XE#4354]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][123] ([Intel XE#2316]) -> [PASS][124] +7 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#4543]) -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][127] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#4543]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][131] ([Intel XE#1874]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-adlp:         [ABORT][133] ([Intel XE#2953]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_lease@lease-unleased-connector.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_lease@lease-unleased-connector.html

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][136] +3 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][137] ([Intel XE#4596]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][139] ([Intel XE#2142]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208]) -> [PASS][142] +186 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][143] ([Intel XE#5786]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [SKIP][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170]) ([Intel XE#378]) -> ([PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-466/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-466/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-466/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-466/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-466/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [FAIL][195] ([Intel XE#5507]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-5/igt@xe_pat@pat-index-xe2.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-4/igt@xe_pm@s2idle-mocs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-8/igt@xe_pm@s2idle-mocs.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][199] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][200] ([Intel XE#4543])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_async_flips@crc-atomic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_async_flips@crc-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#316]) -> [SKIP][202] ([Intel XE#2351] / [Intel XE#4208])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][204] ([Intel XE#316])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#4208]) -> [SKIP][206] ([Intel XE#316]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#316]) -> [SKIP][208] ([Intel XE#4208]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1124]) -> [SKIP][210] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][212] ([Intel XE#607])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][214] ([Intel XE#1124]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#4208]) +10 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#4208]) -> [SKIP][218] ([Intel XE#1124]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4208] / [i915#2575]) -> [SKIP][220] ([Intel XE#2191])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2191]) -> [SKIP][222] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#4208] / [i915#2575]) -> [SKIP][224] ([Intel XE#367]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#367]) -> [SKIP][226] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][228] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][234] ([Intel XE#4208]) +11 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208]) -> [SKIP][236] ([Intel XE#3442])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2907]) -> [SKIP][238] ([Intel XE#4208]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208]) -> [SKIP][240] ([Intel XE#2907])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#306]) -> [SKIP][242] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208] / [i915#2575]) -> [SKIP][244] ([Intel XE#373]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#373]) -> [SKIP][246] ([Intel XE#4208] / [i915#2575]) +13 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][247] ([Intel XE#1178]) -> [SKIP][248] ([Intel XE#4208] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_content_protection@atomic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#307]) -> [SKIP][250] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208] / [i915#2575]) -> [SKIP][252] ([Intel XE#307])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][253] ([Intel XE#1178]) -> [SKIP][254] ([Intel XE#2341])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_content_protection@srm.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208] / [i915#2575]) -> [FAIL][256] ([Intel XE#1188])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_content_protection@uevent.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4208] / [i915#2575]) -> [SKIP][258] ([Intel XE#308])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#308]) -> [SKIP][260] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#455]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208] / [i915#2575]) -> [SKIP][264] ([Intel XE#323])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#323]) -> [SKIP][266] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#4356]) -> [SKIP][268] ([Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4422]) -> [SKIP][270] ([Intel XE#4208]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1138]) -> [SKIP][272] ([Intel XE#4208] / [i915#2575])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1135]) -> [SKIP][274] ([Intel XE#4208] / [i915#2575])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#4208] / [i915#2575]) -> [FAIL][276] ([Intel XE#3098])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#455]) -> [SKIP][278] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#4208]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#455]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#651]) -> [SKIP][284] ([Intel XE#4208]) +22 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#651]) +15 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][287] ([Intel XE#2312]) -> [SKIP][288] ([Intel XE#2311]) +16 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][289] ([Intel XE#2311]) -> [SKIP][290] ([Intel XE#2312]) +9 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#651]) -> [SKIP][292] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][294] ([Intel XE#651]) +11 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#5390]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][297] ([Intel XE#5390]) -> [SKIP][298] ([Intel XE#2312]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#658]) -> [SKIP][300] ([Intel XE#2351] / [Intel XE#4208])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][302] ([Intel XE#658])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][303] ([Intel XE#2313]) -> [SKIP][304] ([Intel XE#2312]) +12 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#653]) -> [SKIP][306] ([Intel XE#4208]) +25 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2312]) -> [SKIP][308] ([Intel XE#2313]) +13 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][310] ([Intel XE#653]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#653]) +22 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#653]) -> [SKIP][314] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208] / [i915#2575]) -> [SKIP][316] ([Intel XE#455]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#346]) -> [SKIP][318] ([Intel XE#4208])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2927]) -> [SKIP][320] ([Intel XE#4208])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#2925])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208] / [i915#2575]) -> [FAIL][324] ([Intel XE#616])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#5021]) -> [SKIP][326] ([Intel XE#4208] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208] / [i915#2575]) -> [SKIP][328] ([Intel XE#5021])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#870]) -> [SKIP][330] ([Intel XE#4208])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#870]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1129]) -> [SKIP][334] ([Intel XE#4208])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#3309]) -> [SKIP][336] ([Intel XE#4208])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][338] ([Intel XE#1129])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][340] ([Intel XE#1406] / [Intel XE#4208]) +10 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][342] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1122] / [Intel XE#1406]) -> [SKIP][344] ([Intel XE#1406] / [Intel XE#4208]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][346] ([Intel XE#1406] / [Intel XE#4208]) +8 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][348] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_psr@pr-dpms.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][350] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][352] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#3414]) -> [SKIP][354] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1127]) -> [SKIP][356] ([Intel XE#4208] / [i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208] / [i915#2575]) -> [SKIP][358] ([Intel XE#3414]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][359] ([Intel XE#1729]) -> [SKIP][360] ([Intel XE#2426])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#362]) -> [SKIP][362] ([Intel XE#4208] / [i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208] / [i915#2575]) -> [SKIP][364] ([Intel XE#1500])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208]) -> [FAIL][366] ([Intel XE#5890])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][367] -> [SKIP][368] ([Intel XE#4208])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_configfs@survivability-mode.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#1123])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1123]) -> [SKIP][372] ([Intel XE#4208]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208]) -> [SKIP][374] ([Intel XE#1126]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#5626]) -> [SKIP][376] ([Intel XE#4208]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208]) -> [SKIP][378] ([Intel XE#5626])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#4837]) -> [SKIP][380] ([Intel XE#4208]) +16 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_eudebug@basic-close.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#4208]) -> [SKIP][382] ([Intel XE#4837]) +12 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208]) -> [SKIP][384] ([Intel XE#1392]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#4208]) -> [SKIP][386] ([Intel XE#288]) +25 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#288]) -> [SKIP][388] ([Intel XE#4208]) +30 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2360]) -> [SKIP][390] ([Intel XE#4208])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208]) -> [SKIP][392] ([Intel XE#4915]) +245 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-huge.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#4915]) -> [SKIP][394] ([Intel XE#4208]) +306 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208]) -> [SKIP][396] ([Intel XE#3573]) +7 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#3573]) -> [SKIP][398] ([Intel XE#4208]) +9 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#4208]) -> [SKIP][400] ([Intel XE#979])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][402] ([Intel XE#4208]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#5742]) -> [SKIP][404] ([Intel XE#4208])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_pm@d3hot-i2c.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#4650]) -> [SKIP][406] ([Intel XE#4208])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [ABORT][407] ([Intel XE#3970]) -> [DMESG-WARN][408] ([Intel XE#3876])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#4733]) -> [SKIP][410] ([Intel XE#4208]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#4208]) -> [SKIP][412] ([Intel XE#4733]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#944]) -> [SKIP][414] ([Intel XE#4208]) +4 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#944]) +2 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#4814]) -> [SKIP][418] ([Intel XE#4208])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> [SKIP][420] ([Intel XE#4821])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#4208]) -> [SKIP][422] ([Intel XE#4130])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#4130]) -> [SKIP][424] ([Intel XE#4208]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d -> xe-pw-153617v1

  IGT_8512: 8512
  xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d: 012aab4eb5fae302cfaad393238faddf6ca6c67d
  xe-pw-153617v1: 153617v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/index.html

--===============5351377592085715958==
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
<tr><td><b>Series:</b></td><td>Smatch static checker warning fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153617/">https://patchwork.freedesktop.org/series/153617/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153617v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153617v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3625-012aab4eb5fae302cfaad393238faddf6=
ca6c67d_FULL -&gt; xe-pw-153617v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153617v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@fbdev@=
read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153617v1/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-lnl-4/igt@kms_async_flips@test-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_atomic_transition@plane-a=
ll-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation=
-180-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation=
-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-st=
ress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@kms_chamelium_frames@vga-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on=
-nop-interruptible@ab-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@km=
s_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153617v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_psr2_sf@pr-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_psr@pr-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">In=
tel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@kms_psr@psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_ro=
tation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_rotation=
_crc@sprite-rotation-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +93 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5794">Intel XE#5794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_compute_preempt@compute-=
preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_eudebug_online@interrupt=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_eudebug_online@interrupt-=
other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_exec_fault_mode@many-exec=
queues-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-busy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_exec_system_allocator@ma=
ny-stride-malloc-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-bmg-1/igt@xe_exec_system_allocator@once=
-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_exec_system_allocator@onc=
e-mmap-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_oa@invalid-oa-metric-set=
-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@xe_pm@d3hot-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">In=
tel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_vm@=
large-split-binds-536870912.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_vm@large-spl=
it-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +233 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@fbdev@=
nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@fbdev@nullptr.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153617v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153617v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_curs=
or_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg=
-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_flip@2x-fl=
ip-vs-dpms.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-3/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-2=
/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153617v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_lea=
se@lease-unleased-connector.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-adlp-9/igt@k=
ms_lease@lease-unleased-connector.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_lea=
se@lease-unleased-connector@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153617v1/shard-adlp-9/igt@kms_lease@lease-unleased-connector@pipe=
-c-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-l=
nl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exe=
c_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-=
463/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +186 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6c=
a6c67d/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238f=
addf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad=
393238faddf6ca6c67d/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae30=
2cfaad393238faddf6ca6c67d/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb=
5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012=
aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-36=
25-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-432=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6=
c67d/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393238fad=
df6ca6c67d/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cfaad393=
238faddf6ca6c67d/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fae302cf=
aad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab4eb5fa=
e302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-012aab=
4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3625-=
012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-46=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53617v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153617v1/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-153617v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153617v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/=
shard-dg2-436/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-5/igt@xe_pat@p=
at-index-xe2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-3/igt@xe_pat@pat-index-x=
e2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-4/igt@xe_pm@s=
2idle-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-adlp-8/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-adlp-6/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#45=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-adlp-9/igt@kms_async_flips@crc-atomic.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@km=
s_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard=
-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt=
@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v=
1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153617v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-43=
4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/s=
hard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153617v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153617v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2=
-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard=
-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_chameli=
um_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ch=
amelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153617v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-=
434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2=
-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-=
434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/=
igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/=
shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/=
shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@km=
s_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3617v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153617v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153617v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153617v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-3=
2bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617=
v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/s=
hard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt=
@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153617v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v=
1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153617v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617=
v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sha=
rd-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/=
igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_=
plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-d=
g2-432/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms=
_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@=
kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Int=
el XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153617v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ps=
r2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53617v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-43=
4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#=
929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53617v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Inte=
l XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-4=
34/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ps=
r@pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1536=
17v1/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ps=
r@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-d=
g2-432/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-d=
g2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-d=
g2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/sh=
ard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-2/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@=
kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153617v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464=
/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_configfs@surviv=
ability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt=
@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-432/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_eu_=
stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_e=
u_stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-463/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_eud=
ebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_=
eudebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153617v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-man=
y-vm-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exe=
c_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464=
/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-=
dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg=
2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_exe=
c_system_allocator@process-many-mmap-huge.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard=
-dg2-436/igt@xe_exec_system_allocator@process-many-mmap-huge.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Inte=
l XE#4915</a>) +245 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +306 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-43=
4/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-436/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-463/igt@xe_pm@=
d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5742">Intel XE#5742</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pm@d3hot-i2c.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-bmg-1/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-bmg-2/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_pxp=
@display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_pxp@displa=
y-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-d=
g2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE=
#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-4=
64/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_ren=
der_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-434/=
igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2-464/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153617v1/shard-dg2=
-436/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel X=
E#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153617v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d -&gt; xe-pw-153=
617v1</li>
</ul>
<p>IGT_8512: 8512<br />
  xe-3625-012aab4eb5fae302cfaad393238faddf6ca6c67d: 012aab4eb5fae302cfaad39=
3238faddf6ca6c67d<br />
  xe-pw-153617v1: 153617v1</p>

</body>
</html>

--===============5351377592085715958==--
